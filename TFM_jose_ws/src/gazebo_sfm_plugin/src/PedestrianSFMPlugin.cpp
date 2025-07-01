/***********************************************************************/
/**                                                                    */
/** PedestrianSFMPlugin.cpp                                            */
/**                                                                    */
/** Copyright (c) 2021, Service Robotics Lab (SRL).                    */
/**                     http://robotics.upo.es                         */
/**                                                                    */
/** All rights reserved.                                               */
/**                                                                    */
/** Authors:                                                           */
/** Noé Pérez-Higueras (maintainer)                                    */
/** email: noeperez@upo.es                                             */
/**                                                                    */
/** This software may be modified and distributed under the terms      */
/** of the BSD license. See the LICENSE file for details.              */
/**                                                                    */
/** http://www.opensource.org/licenses/BSD-3-Clause                    */
/**                                                                    */
/***********************************************************************/

#include <functional>
#include <string>
#include <geometry_msgs/Point.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <dynamic_reconfigure/server.h>
#include <gazebo_sfm_plugin/PedestrianSFMPluginConfig.h>
#include <gazebo_sfm_plugin/PedestrianSFMPlugin.h>
#include <boost/bind/bind.hpp>

using namespace gazebo;
GZ_REGISTER_MODEL_PLUGIN(PedestrianSFMPlugin)

#define WALKING_ANIMATION "walking"

/////////////////////////////////////////////////
PedestrianSFMPlugin::PedestrianSFMPlugin() : 
    actionClient_(nullptr),
    actionServer_(nullptr)
{
}

/////////////////////////////////////////////////
PedestrianSFMPlugin::~PedestrianSFMPlugin()
{
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::Load(physics::ModelPtr _model, sdf::ElementPtr _sdf)
{
  this->sdf = _sdf;
  this->actor = boost::dynamic_pointer_cast<physics::Actor>(_model);
  this->world = this->actor->GetWorld();

  this->sfmActor.id = this->actor->GetId();

  this->connections.push_back(event::Events::ConnectWorldUpdateBegin(
      std::bind(&PedestrianSFMPlugin::OnUpdate, this, std::placeholders::_1)));

  this->Reset();

  // Initialize sfmActor position
  ignition::math::Vector3d pos = this->actor->WorldPose().Pos();
  ignition::math::Vector3d rpy = this->actor->WorldPose().Rot().Euler();
  this->sfmActor.position.set(pos.X(), pos.Y());
  this->sfmActor.yaw = utils::Angle::fromRadian(rpy.Z());
  ignition::math::Vector3d linvel = this->actor->WorldLinearVel();
  this->sfmActor.velocity.set(linvel.X(), linvel.Y());
  this->sfmActor.linearVelocity = linvel.Length();
  ignition::math::Vector3d angvel = this->actor->WorldAngularVel();
  this->sfmActor.angularVelocity = angvel.Z();

  // Read parameters from SDF
  if (_sdf->HasElement("velocity"))
    this->sfmActor.desiredVelocity = _sdf->Get<double>("velocity");
  else
    this->sfmActor.desiredVelocity = 0.8;

  if (_sdf->HasElement("goal_weight"))
    this->sfmActor.params.forceFactorDesired = _sdf->Get<double>("goal_weight");
  if (_sdf->HasElement("obstacle_weight"))
    this->sfmActor.params.forceFactorObstacle = _sdf->Get<double>("obstacle_weight");
  if (_sdf->HasElement("social_weight"))
    this->sfmActor.params.forceFactorSocial = _sdf->Get<double>("social_weight");
  if (_sdf->HasElement("group_gaze_weight"))
    this->sfmActor.params.forceFactorGroupGaze = _sdf->Get<double>("group_gaze_weight");
  if (_sdf->HasElement("group_coh_weight"))
    this->sfmActor.params.forceFactorGroupCoherence = _sdf->Get<double>("group_coh_weight");
  if (_sdf->HasElement("group_rep_weight"))
    this->sfmActor.params.forceFactorGroupRepulsion = _sdf->Get<double>("group_rep_weight");

  if (_sdf->HasElement("animation_factor"))
    this->animationFactor = _sdf->Get<double>("animation_factor");
  else
    this->animationFactor = 4.5;

  if (_sdf->HasElement("people_distance"))
    this->peopleDistance = _sdf->Get<double>("people_distance");
  else
    this->peopleDistance = 5.0;

  // Initialize ROS
  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "pedestrian_sfm_plugin_node", ros::init_options::NoSigintHandler);
  }

  std::string pedestrianNamespace = "/" + this->actor->GetName();
  this->nodeHandle.reset(new ros::NodeHandle(pedestrianNamespace));

  // Initialize services
  std::string serviceName = "/" + this->actor->GetName() + "/update_waypoint";
  this->updateWaypointService = this->nodeHandle->advertiseService(
    serviceName, &PedestrianSFMPlugin::UpdateWaypointCallback, this);

  serviceName = "/" + this->actor->GetName() + "/return_home";
  this->returnHomeService = this->nodeHandle->advertiseService(
    serviceName, &PedestrianSFMPlugin::ReturnHomeCallback, this);

  // Initialize dynamic reconfigure
  reconfigureServer = std::make_unique<dynamic_reconfigure::Server<gazebo_sfm_plugin::PedestrianSFMPluginConfig>>(*this->nodeHandle);
  reconfigureServer->setCallback(boost::bind(&PedestrianSFMPlugin::reconfigureCallback, this, _1, _2));

  // Initialize action client and server
  std::string action_name = "/" + this->actor->GetName() + "/task_assignment";
  this->actionClient_.reset(new actionlib::SimpleActionClient<gazebo_sfm_plugin::TaskAssignmentAction>(
    *this->nodeHandle, action_name, true));

  this->actionServer_.reset(new actionlib::SimpleActionServer<gazebo_sfm_plugin::TaskAssignmentAction>(
    *this->nodeHandle, 
    "task_assignment",
    boost::bind(&PedestrianSFMPlugin::executeTaskAssignment, this, _1),
    false));
  this->actionServer_->start();

  ROS_INFO("Pedestrian SFM Plugin loaded for %s", this->actor->GetName().c_str());
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::Reset()
{
  this->lastUpdate = 0;

  if (this->sdf->HasElement("trajectory"))
  {
    sdf::ElementPtr modelElemCyclic =
        this->sdf->GetElement("trajectory")->GetElement("cyclic");

    if (modelElemCyclic)
      this->sfmActor.cyclicGoals = modelElemCyclic->Get<bool>();

    sdf::ElementPtr modelElem =
        this->sdf->GetElement("trajectory")->GetElement("waypoint");
    while (modelElem)
    {
      ignition::math::Vector3d g = modelElem->Get<ignition::math::Vector3d>();
      sfm::Goal goal;
      goal.center.set(g.X(), g.Y());
      goal.radius = 0.3;
      this->sfmActor.goals.push_back(goal);
      modelElem = modelElem->GetNextElement("waypoint");
    }
  }

  auto skelAnims = this->actor->SkeletonAnimations();
  if (skelAnims.find(WALKING_ANIMATION) == skelAnims.end())
  {
    gzerr << "Skeleton animation " << WALKING_ANIMATION << " not found.\n";
  }
  else
  {
    this->trajectoryInfo.reset(new physics::TrajectoryInfo());
    this->trajectoryInfo->type = WALKING_ANIMATION;
    this->trajectoryInfo->duration = 1.0;
    this->actor->SetCustomTrajectory(this->trajectoryInfo);
  }
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::HandleObstacles()
{
  double minDist = 10000.0;
  ignition::math::Vector3d closest_obs;
  this->sfmActor.obstacles1.clear();

  for (unsigned int i = 0; i < this->world->ModelCount(); ++i)
  {
    physics::ModelPtr model = this->world->ModelByIndex(i);
    if (std::find(this->ignoreModels.begin(), this->ignoreModels.end(),
                  model->GetName()) == this->ignoreModels.end())
    {
      ignition::math::Vector3d actorPos = this->actor->WorldPose().Pos();
      ignition::math::Vector3d modelPos = model->WorldPose().Pos();

      if (model->GetId() == this->actor->GetId())
        continue;

      if (modelPos.X() == 0.0 && modelPos.Y() == 0.0)
        continue;

      ignition::math::Line3d act_obs_line(actorPos, modelPos);
      std::tuple<bool, double, ignition::math::Vector3d> obs_intersect =
          model->BoundingBox().Intersect(act_obs_line);

      ignition::math::Vector3d intersecPos;
      double dist = -1;
      if (std::get<0>(obs_intersect) == true)
      {
        intersecPos = std::get<2>(obs_intersect);
        dist = std::get<1>(obs_intersect);
      }
      if (dist > 0)
      {
        ignition::math::Vector3d offset = intersecPos - actorPos;
        double modelDist = offset.Length();
        if (modelDist < minDist)
        {
          minDist = modelDist;
          closest_obs = intersecPos;
        }
      }
    }
  }
  utils::Vector2d ob(closest_obs.X(), closest_obs.Y());
  this->sfmActor.obstacles1.push_back(ob);
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::HandlePedestrians()
{
  this->otherActors.clear();

  for (unsigned int i = 0; i < this->world->ModelCount(); ++i)
  {
    physics::ModelPtr model = this->world->ModelByIndex(i);

    if (model->GetId() != this->actor->GetId() &&
        ((int)model->GetType() == (int)this->actor->GetType()))
    {
      ignition::math::Pose3d modelPose = model->WorldPose();
      ignition::math::Vector3d pos =
          modelPose.Pos() - this->actor->WorldPose().Pos();
      if (pos.Length() < this->peopleDistance)
      {
        sfm::Agent ped;
        ped.id = model->GetId();
        ped.position.set(modelPose.Pos().X(), modelPose.Pos().Y());
        ignition::math::Vector3d rpy = modelPose.Rot().Euler();
        ped.yaw = utils::Angle::fromRadian(rpy.Z());

        ped.radius = this->sfmActor.radius;
        ignition::math::Vector3d linvel = model->WorldLinearVel();
        ped.velocity.set(linvel.X(), linvel.Y());
        ped.linearVelocity = linvel.Length();
        ignition::math::Vector3d angvel = model->WorldAngularVel();
        ped.angularVelocity = angvel.Z();

        if (this->sfmActor.groupId != -1)
        {
          std::vector<std::string>::iterator it;
          it = find(groupNames.begin(), groupNames.end(), model->GetName());
          if (it != groupNames.end())
            ped.groupId = this->sfmActor.groupId;
          else
            ped.groupId = -1;
        }
        this->otherActors.push_back(ped);
      }
    }
  }
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::OnUpdate(const common::UpdateInfo &_info)
{
  double dt = (_info.simTime - this->lastUpdate).Double();

  ignition::math::Pose3d actorPose = this->actor->WorldPose();

  HandleObstacles();
  HandlePedestrians();

  sfm::SFM.computeForces(this->sfmActor, this->otherActors);
  sfm::SFM.updatePosition(this->sfmActor, dt);

  utils::Angle h = this->sfmActor.yaw;
  utils::Angle add = utils::Angle::fromRadian(1.5707);
  h = h + add;
  double yaw = h.toRadian();
  ignition::math::Vector3d rpy = actorPose.Rot().Euler();
  utils::Angle current = utils::Angle::fromRadian(rpy.Z());
  double diff = (h - current).toRadian();
  if (std::fabs(diff) > IGN_DTOR(10))
  {
    current = current + utils::Angle::fromRadian(diff * 0.005);
    yaw = current.toRadian();
  }
  actorPose.Pos().X(this->sfmActor.position.getX());
  actorPose.Pos().Y(this->sfmActor.position.getY());
  actorPose.Rot() =
      ignition::math::Quaterniond(1.5707, 0, yaw);

  actorPose.Pos().Z(1.2138);

  double distanceTraveled =
      (actorPose.Pos() - this->actor->WorldPose().Pos()).Length();

  this->actor->SetWorldPose(actorPose, false, false);
  this->actor->SetScriptTime(this->actor->ScriptTime() +
                             (distanceTraveled * this->animationFactor));
  this->lastUpdate = _info.simTime;
}

bool PedestrianSFMPlugin::UpdateWaypointCallback(gazebo_sfm_plugin::Update_waypoint::Request &req,
  gazebo_sfm_plugin::Update_waypoint::Response &res) {
  this->sfmActor.goals.clear();

  for (const auto &waypoint : req.waypoints) {
    sfm::Goal goal;
    goal.center.set(waypoint.x, waypoint.y);
    goal.radius = 0.3;
    this->sfmActor.goals.push_back(goal); 
  }

  sdf::ElementPtr modelElemCyclic =
    this->sdf->GetElement("trajectory")->GetElement("cyclic");
  if(!modelElemCyclic){
    sdf::ElementPtr modelElemHome =
    this->sdf->GetElement("trajectory")->GetElement("home");
    if (modelElemHome)
    {
      sfm::Goal goal;
      ROS_INFO("%s will return home", this->actor->GetName().c_str());
      ignition::math::Vector3d g = modelElemHome->Get<ignition::math::Vector3d>();
      goal.center.set(g.X(), g.Y());
      goal.radius = 0.3;
      this->sfmActor.goals.push_back(goal);
    }
  }

  res.success = true;
  return true;
}

bool PedestrianSFMPlugin::ReturnHomeCallback(gazebo_sfm_plugin::Return_home::Request &req,
                                           gazebo_sfm_plugin::Return_home::Response &res) {
    this->sfmActor.goals.clear();

    sdf::ElementPtr modelElemHome = this->sdf->GetElement("trajectory")->GetElement("home");
    if (modelElemHome) {
        ROS_INFO("%s will return home", this->actor->GetName().c_str());
        ignition::math::Vector3d g = modelElemHome->Get<ignition::math::Vector3d>();
        sfm::Goal goal;
        goal.center.set(g.X(), g.Y());
        goal.radius = 0.3;
        this->sfmActor.goals.push_back(goal);
        res.success = true;
    } else {
        ROS_WARN("%s has no home defined", this->actor->GetName().c_str());
        res.success = false;
    }

    return true;
}

void PedestrianSFMPlugin::reconfigureCallback(gazebo_sfm_plugin::PedestrianSFMPluginConfig &config, uint32_t level) {
  this->sfmActor.desiredVelocity = config.pedestrian_velocity;
  this->sfmActor.cyclicGoals = config.cyclic;

  ROS_INFO("New velocity %s: %.2f m/s", this->actor->GetName().c_str(), config.pedestrian_velocity);
  ROS_INFO("New cyclic %d",config.cyclic);
}

void PedestrianSFMPlugin::executeTaskAssignment(const gazebo_sfm_plugin::TaskAssignmentGoalConstPtr &goal) {
    this->sfmActor.goals.clear();
    
    for (const auto &position : goal->positions) {
        sfm::Goal sfmGoal;
        sfmGoal.center.set(position.x, position.y);
        sfmGoal.radius = 0.3;
        this->sfmActor.goals.push_back(sfmGoal);
    }
    
    ROS_INFO("%s received new task assignment with %lu waypoints", 
             this->actor->GetName().c_str(), goal->positions.size());

    sdf::ElementPtr modelElemCyclic = this->sdf->GetElement("trajectory")->GetElement("cyclic");
    if (!modelElemCyclic) {
        sdf::ElementPtr modelElemHome = this->sdf->GetElement("trajectory")->GetElement("home");
        if (modelElemHome) {
            sfm::Goal goal;
            ROS_INFO("%s will return home", this->actor->GetName().c_str());
            ignition::math::Vector3d g = modelElemHome->Get<ignition::math::Vector3d>();
            goal.center.set(g.X(), g.Y());
            goal.radius = 0.3;
            this->sfmActor.goals.push_back(goal);
        }
    }

    gazebo_sfm_plugin::TaskAssignmentResult result;
    result.success = true;
    result.message = "Task assignment completed successfully";
    actionServer_->setSucceeded(result);
}