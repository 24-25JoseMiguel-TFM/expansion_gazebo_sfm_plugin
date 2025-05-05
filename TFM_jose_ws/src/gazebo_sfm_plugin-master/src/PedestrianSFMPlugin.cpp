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
#include <stdio.h>
#include <string>

#include <gazebo/physics/RayShape.hh>
#include <gazebo/physics/PhysicsEngine.hh>

// Includes del servcio (Jose Miguel TFM 2025)

#include <geometry_msgs/Point.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <gazebo_sfm_plugin/Return_home.h>


// Includes dynamic configure

#include <dynamic_reconfigure/server.h>
#include <gazebo_sfm_plugin/PedestrianSFMPluginConfig.h>

// #include <ignition/math.hh>
// #include <ignition/math/gzmath.hh>
#include <gazebo_sfm_plugin/PedestrianSFMPlugin.h>

#include <boost/bind/bind.hpp>
using namespace boost::placeholders;  // Para _1, _2, etc.

using namespace gazebo;
GZ_REGISTER_MODEL_PLUGIN(PedestrianSFMPlugin)

#define WALKING_ANIMATION "walking"

/////////////////////////////////////////////////
PedestrianSFMPlugin::PedestrianSFMPlugin() {}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::Load(physics::ModelPtr _model, sdf::ElementPtr _sdf)
{
  this->sdf = _sdf;
  this->actor = boost::dynamic_pointer_cast<physics::Actor>(_model);
  this->world = this->actor->GetWorld();

  this->sfmActor.id = this->actor->GetId();

  // std::string s = "scott>=tiger";
  // std::string delimiter = ">=";
  // std::string token = s.substr(0, s.find(delimiter));

  this->connections.push_back(event::Events::ConnectWorldUpdateBegin(
      std::bind(&PedestrianSFMPlugin::OnUpdate, this, std::placeholders::_1)));

  this->Reset();

  // Initialize sfmActor position
  ignition::math::Vector3d pos = this->actor->WorldPose().Pos();
  ignition::math::Vector3d rpy = this->actor->WorldPose().Rot().Euler();
  this->sfmActor.position.set(pos.X(), pos.Y());
  this->sfmActor.yaw = utils::Angle::fromRadian(rpy.Z()); // yaw
  ignition::math::Vector3d linvel = this->actor->WorldLinearVel();
  this->sfmActor.velocity.set(linvel.X(), linvel.Y());
  this->sfmActor.linearVelocity = linvel.Length();
  ignition::math::Vector3d angvel = this->actor->WorldAngularVel();
  this->sfmActor.angularVelocity = angvel.Z(); // Length()

  // Read in the maximum velocity of the pedestrian
  if (_sdf->HasElement("velocity"))
    this->sfmActor.desiredVelocity = _sdf->Get<double>("velocity");
  else
    this->sfmActor.desiredVelocity = 0.8;

  // Read in the target weight
  if (_sdf->HasElement("goal_weight"))
    this->sfmActor.params.forceFactorDesired = _sdf->Get<double>("goal_weight");
  // Read in the obstacle weight
  if (_sdf->HasElement("obstacle_weight"))
    this->sfmActor.params.forceFactorObstacle =
        _sdf->Get<double>("obstacle_weight");
  // Read in the social weight
  if (_sdf->HasElement("social_weight"))
    this->sfmActor.params.forceFactorSocial =
        _sdf->Get<double>("social_weight");
  // Read in the group gaze weight
  if (_sdf->HasElement("group_gaze_weight"))
    this->sfmActor.params.forceFactorGroupGaze =
        _sdf->Get<double>("group_gaze_weight");
  // Read in the group coherence weight
  if (_sdf->HasElement("group_coh_weight"))
    this->sfmActor.params.forceFactorGroupCoherence =
        _sdf->Get<double>("group_coh_weight");
  // Read in the group repulsion weight
  if (_sdf->HasElement("group_rep_weight"))
    this->sfmActor.params.forceFactorGroupRepulsion =
        _sdf->Get<double>("group_rep_weight");

  // Read in the animation factor (applied in the OnUpdate function).
  if (_sdf->HasElement("animation_factor"))
    this->animationFactor = _sdf->Get<double>("animation_factor");
  else
    this->animationFactor = 4.5;

  if (_sdf->HasElement("people_distance"))
    this->peopleDistance = _sdf->Get<double>("people_distance");
  else
    this->peopleDistance = 5.0;

  // Read in the pedestrians in your walking group
  if (_sdf->HasElement("group"))
  {
    this->sfmActor.groupId = this->sfmActor.id;
    sdf::ElementPtr modelElem = _sdf->GetElement("group")->GetElement("model");
    while (modelElem)
    {
      this->groupNames.push_back(modelElem->Get<std::string>());
      modelElem = modelElem->GetNextElement("model");
    }
    this->sfmActor.groupId = this->sfmActor.id;
  }
  else
    this->sfmActor.groupId = -1;

  // Read in the other obstacles to ignore
  if (_sdf->HasElement("ignore_obstacles"))
  {
    sdf::ElementPtr modelElem =
        _sdf->GetElement("ignore_obstacles")->GetElement("model");
    while (modelElem)
    {
      this->ignoreModels.push_back(modelElem->Get<std::string>());
      modelElem = modelElem->GetNextElement("model");
    }
  }
  // Add our own name to models we should ignore when avoiding obstacles.
  this->ignoreModels.push_back(this->actor->GetName());
  // Add the other pedestrians to the ignored obstacles
  for (unsigned int i = 0; i < this->world->ModelCount(); ++i)
  {
    physics::ModelPtr model = this->world->ModelByIndex(i); // GetModel(i);

    if (model->GetId() != this->actor->GetId() &&
        ((int)model->GetType() == (int)this->actor->GetType()))
    {
      this->ignoreModels.push_back(model->GetName());
    }
  }

  // Initialize ROS (if not already initialized)
  if (!ros::isInitialized()) {
    int argc = 0;
    char **argv = NULL;
    ros::init(argc, argv, "pedestrian_sfm_plugin_node", ros::init_options::NoSigintHandler);
  }

  // Create a unique namespace for this pedestrian
  std::string pedestrianNamespace = "/" + this->actor->GetName();
  ROS_INFO("Initializing pedestrian %s with namespace %s", this->actor->GetName().c_str(), pedestrianNamespace.c_str());
  // Create a unique node handle for this pedestrian
  this->nodeHandle.reset(new ros::NodeHandle(pedestrianNamespace));

  //Nombre de servicio para actualizar los waypoints

  std::string serviceName = "/" + this->actor->GetName() + "/update_waypoint";

  //Nombre de servicio para actualizar los waypoints

  this->updateWaypointService = this->nodeHandle->advertiseService(
    serviceName, &PedestrianSFMPlugin::UpdateWaypointCallback, this);

  serviceName = "/" + this->actor->GetName() + "/return_home";

  this->returnHomeService=this->nodeHandle->advertiseService(
    serviceName, &PedestrianSFMPlugin::ReturnHomeCallback, this);

  // Inicializar el servidor dynamic_reconfigure
  reconfigureServer = std::make_unique<dynamic_reconfigure::Server<gazebo_sfm_plugin::PedestrianSFMPluginConfig>>(*this->nodeHandle);
  reconfigureServer->setCallback(boost::bind(&PedestrianSFMPlugin::reconfigureCallback, this, _1, _2));
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::Reset()
{
  // this->velocity = 0.8;
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
    // Create custom trajectory
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
  ignition::math::Vector3d closest_obs2;
  this->sfmActor.obstacles1.clear();

  for (unsigned int i = 0; i < this->world->ModelCount(); ++i)
  {
    physics::ModelPtr model = this->world->ModelByIndex(i); // GetModel(i);
    if (std::find(this->ignoreModels.begin(), this->ignoreModels.end(),
                  model->GetName()) == this->ignoreModels.end())
    {
      ignition::math::Vector3d actorPos = this->actor->WorldPose().Pos();
      ignition::math::Vector3d modelPos = model->WorldPose().Pos();

      // avoid compute agent itself
      if (model->GetId() == this->actor->GetId())
        continue;

      // This if is used to avoid an invisible obstacle that Gazebo is setting at (0,0). We don't know why it's happening.
      if (modelPos.X() == 0.0 && modelPos.Y() == 0.0)
        continue;

      // std::tuple<bool, double, ignition::math::Vector3d> intersect =
      //     model->BoundingBox().Intersect(modelPos, actorPos, 0.05, 8.0);
      // ignition::math::Vector3d offset = std::get<2>(intersect) - actorPos;
      // double modelDist = offset.Length();
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
        double modelDist = offset.Length(); //-approximated_radius;
        // double dist2 = actorPos.Distance(std::get<2>(intersect));
        if (modelDist < minDist)
        {
          minDist = modelDist;
          closest_obs = intersecPos;
          // closest_obs = std::get<2>(intersect);
        }
      }
    }
  }

  // printf("Actor %s x: %.2f y: %.2f\n", this->actor->GetName().c_str(),
  //        this->actor->WorldPose().Pos().X(),
  //        this->actor->WorldPose().Pos().Y());
  // printf("Model offset x: %.2f y: %.2f\n", closest_obs.X(), closest_obs.Y());
  // printf("Model intersec x: %.2f y: %.2f\n\n", closest_obs2.X(),
  //        closest_obs2.Y());
  utils::Vector2d ob(closest_obs.X(), closest_obs.Y());
  this->sfmActor.obstacles1.push_back(ob);
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::HandlePedestrians()
{
  this->otherActors.clear();

  for (unsigned int i = 0; i < this->world->ModelCount(); ++i)
  {
    physics::ModelPtr model = this->world->ModelByIndex(i); // GetModel(i);

    if (model->GetId() != this->actor->GetId() &&
        ((int)model->GetType() == (int)this->actor->GetType()))
    {
      // printf("Actor %i has detected actor %i!\n", this->actor->GetId(),
      // model->GetId());
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
        ped.angularVelocity = angvel.Z(); // Length()

        // check if the ped belongs to my group
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
  // printf("Actor %i has detected %i actors!\n", this->actor->GetId(),
  // (int)this->otherActors.size());
}

/////////////////////////////////////////////////
void PedestrianSFMPlugin::OnUpdate(const common::UpdateInfo &_info)
{
  // Time delta
  double dt = (_info.simTime - this->lastUpdate).Double();

  ignition::math::Pose3d actorPose = this->actor->WorldPose();

  // Track if the agent just finished waiting
  bool justFinishedWaiting = this->sfmActor.isWaiting && 
                           (this->sfmActor.waitingTimeLeft - dt <= 0);

  // update closest obstacle
  HandleObstacles();

  // update pedestrian around
  HandlePedestrians();
  // Compute Social Forces
  sfm::SFM.computeForces(this->sfmActor, this->otherActors);
  // Update model
  sfm::SFM.updatePosition(this->sfmActor, dt);
  utils::Angle h = this->sfmActor.yaw;
  utils::Angle add = utils::Angle::fromRadian(1.5707);
  h = h + add;
  double yaw = h.toRadian();
  // double yaw = this->sfmActor.yaw.toRadian();
  // Rotate in place, instead of jumping.
  // if (std::abs(yaw.Radian()) > IGN_DTOR(10))
  //{
  //  ActorPose.Rot() = ignition::math::Quaterniond(1.5707, 0, rpy.Z()+
  //      yaw.Radian()*0.001);
  //}
  // else
  //{
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
      ignition::math::Quaterniond(1.5707, 0, yaw); // rpy.Z()+yaw.Radian());
  //}

  // Make sure the actor stays within bounds
  // actorPose.Pos().X(std::max(-3.0, std::min(3.5, actorPose.Pos().X())));
  // actorPose.Pos().Y(std::max(-10.0, std::min(2.0, actorPose.Pos().Y())));
  actorPose.Pos().Z(1.2138);

  // Distance traveled is used to coordinate motion with the walking
  // animation
  double distanceTraveled =
      (actorPose.Pos() - this->actor->WorldPose().Pos()).Length();

  this->actor->SetWorldPose(actorPose, false, false);
  this->actor->SetScriptTime(this->actor->ScriptTime() +
                             (distanceTraveled * this->animationFactor));
  this->lastUpdate = _info.simTime;

  if (justFinishedWaiting) {
    ROS_INFO("Pedestrian %s has finished a goal.",
             this->actor->GetName().c_str());
  }
}

////////////////////////////////////////////////////////////////////////////////////////
///Servicio para actualizar waypoints tfm

// Waypoint Updates Callback
bool PedestrianSFMPlugin::UpdateWaypointCallback(gazebo_sfm_plugin::Update_waypoint::Request &req,
  gazebo_sfm_plugin::Update_waypoint::Response &res) {
// Clear goals
this->sfmActor.goals.clear();

// Adds new Waypoints
for (const auto &waypoint : req.waypoints) {
sfm::Goal goal;
goal.center.set(waypoint.x, waypoint.y);
goal.radius = 0.3;  // Radius Tolerance
this->sfmActor.goals.push_back(goal);
}

if(sfmActor.cyclicGoals==0){

  sdf::ElementPtr modelElemHome =
  this->sdf->GetElement("trajectory")->GetElement("home");
  if (modelElemHome) // Check if "home" element exists
  {
  sfm::Goal goal;
  ROS_INFO("%s volvera a su punto inicial tras acabar el punto", this->actor->GetName().c_str());
  ignition::math::Vector3d g = modelElemHome->Get<ignition::math::Vector3d>();
  goal.center.set(g.X(), g.Y());
  goal.radius = 0.3;
  this->sfmActor.waitAtGoalDuration = 5.0;
  this->sfmActor.goals.push_back(goal);
  }
  else{

    ROS_INFO("%s No tiene punto inicial", this->actor->GetName().c_str());
  
  }

}
else{

  ROS_INFO("%s repetira el waypoint", this->actor->GetName().c_str());

}

// Responder con éxito
res.success = true;
return true;
}

bool PedestrianSFMPlugin::ReturnHomeCallback(gazebo_sfm_plugin::Return_home::Request &req,
gazebo_sfm_plugin::Return_home::Response &res) {

    this->sfmActor.goals.clear();
    sdf::ElementPtr modelElemHome =
    this->sdf->GetElement("trajectory")->GetElement("home");
    if (modelElemHome) // Check if "home" element exists
    {
    sfm::Goal goal;
    ROS_INFO("%s volvera a su punto inicial ", this->actor->GetName().c_str());
    ignition::math::Vector3d g = modelElemHome->Get<ignition::math::Vector3d>();
    goal.center.set(g.X(), g.Y());
    goal.radius = 0.3;
    this->sfmActor.waitAtGoalDuration = 5.0;
    this->sfmActor.goals.push_back(goal);
    res.success =true;
    return true;

    }
    else{

      ROS_INFO("%s No tiene punto inicial", this->actor->GetName().c_str());
      res.success =false;
      return false;
    
    }

}

void PedestrianSFMPlugin::reconfigureCallback(gazebo_sfm_plugin::PedestrianSFMPluginConfig &config, uint32_t level) {
  // Actualizar la velocidad deseada del peatón
  this->sfmActor.desiredVelocity = config.pedestrian_velocity;
  this->sfmActor.cyclicGoals = config.cyclic;

  ROS_INFO("Nueva velocidad deseada para %s: %.2f m/s", this->actor->GetName().c_str(), config.pedestrian_velocity);
  ROS_INFO("Nuevo cyclic %d",config.cyclic);
}