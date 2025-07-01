#ifndef GAZEBO_PLUGINS_PEDESTRIANSFMPLUGIN_HH_
#define GAZEBO_PLUGINS_PEDESTRIANSFMPLUGIN_HH_

// C++
#include <string>
#include <vector>
#include <algorithm>
#include <memory>

// Gazebo
#include "gazebo/common/Plugin.hh"
#include "gazebo/physics/physics.hh"
#include "gazebo/util/system.hh"

// Social Force Model
#include <lightsfm/sfm.hpp>

// ROS
#include <ros/ros.h>
#include <dynamic_reconfigure/server.h>

// Services
#include <gazebo_sfm_plugin/Return_home.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <gazebo_sfm_plugin/PedestrianSFMPluginConfig.h>

// Action
#include <actionlib/client/simple_action_client.h>
#include <actionlib/server/simple_action_server.h>
#include <gazebo_sfm_plugin/TaskAssignmentAction.h>

namespace gazebo
{
class GZ_PLUGIN_VISIBLE PedestrianSFMPlugin : public ModelPlugin
{
public:
  PedestrianSFMPlugin();
  virtual ~PedestrianSFMPlugin();

  virtual void Load(physics::ModelPtr _model, sdf::ElementPtr _sdf);
  virtual void Reset();

private:
  void OnUpdate(const common::UpdateInfo &_info);
  void HandleObstacles();
  void HandlePedestrians();
  
  bool UpdateWaypointCallback(gazebo_sfm_plugin::Update_waypoint::Request &req,
                            gazebo_sfm_plugin::Update_waypoint::Response &res);
  bool ReturnHomeCallback(gazebo_sfm_plugin::Return_home::Request &req,
                        gazebo_sfm_plugin::Return_home::Response &res);
  void reconfigureCallback(gazebo_sfm_plugin::PedestrianSFMPluginConfig &config, uint32_t level);
  void executeTaskAssignment(const gazebo_sfm_plugin::TaskAssignmentGoalConstPtr &goal);

  // SFM related
  sfm::Agent sfmActor;
  std::vector<std::string> groupNames;
  std::vector<sfm::Agent> otherActors;
  double peopleDistance;

  // Gazebo related
  physics::ActorPtr actor;
  physics::WorldPtr world;
  sdf::ElementPtr sdf;
  ignition::math::Vector3d velocity;
  std::vector<event::ConnectionPtr> connections;
  double animationFactor;
  common::Time lastUpdate;
  std::vector<std::string> ignoreModels;
  physics::TrajectoryInfoPtr trajectoryInfo;

  // ROS related
  std::unique_ptr<ros::NodeHandle> nodeHandle;
  ros::ServiceServer updateWaypointService;
  ros::ServiceServer returnHomeService;
  std::unique_ptr<dynamic_reconfigure::Server<gazebo_sfm_plugin::PedestrianSFMPluginConfig>> reconfigureServer;
  std::unique_ptr<actionlib::SimpleActionClient<gazebo_sfm_plugin::TaskAssignmentAction>> actionClient_;
  std::unique_ptr<actionlib::SimpleActionServer<gazebo_sfm_plugin::TaskAssignmentAction>> actionServer_;
};
}
#endif