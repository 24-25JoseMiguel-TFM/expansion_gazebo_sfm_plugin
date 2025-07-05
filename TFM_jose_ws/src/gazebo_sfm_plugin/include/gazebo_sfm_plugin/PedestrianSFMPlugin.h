#ifndef GAZEBO_PLUGINS_PEDESTRIANSFMPLUGIN_HH_
#define GAZEBO_PLUGINS_PEDESTRIANSFMPLUGIN_HH_

#include <string>
#include <vector>
#include <memory>

#include "gazebo/common/Plugin.hh"
#include "gazebo/physics/physics.hh"
#include "gazebo/util/system.hh"

#include <lightsfm/sfm.hpp>

#include <ros/ros.h>
#include <dynamic_reconfigure/server.h>
#include <gazebo_sfm_plugin/Return_home.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <gazebo_sfm_plugin/PedestrianSFMPluginConfig.h>

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

  sfm::Agent sfmActor;
  std::vector<std::string> groupNames;
  std::vector<sfm::Agent> otherActors;
  double peopleDistance;

  physics::ActorPtr actor;
  physics::WorldPtr world;
  sdf::ElementPtr sdf;
  ignition::math::Vector3d velocity;
  std::vector<event::ConnectionPtr> connections;
  double animationFactor;
  common::Time lastUpdate;
  std::vector<std::string> ignoreModels;
  physics::TrajectoryInfoPtr trajectoryInfo;

  std::unique_ptr<ros::NodeHandle> nodeHandle;
  ros::ServiceServer updateWaypointService;
  ros::ServiceServer returnHomeService;
  std::unique_ptr<dynamic_reconfigure::Server<gazebo_sfm_plugin::PedestrianSFMPluginConfig>> reconfigureServer;
};
}
#endif