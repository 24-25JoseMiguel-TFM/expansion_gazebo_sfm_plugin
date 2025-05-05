#include "gazebo_sfm_plugin/TaskCoordinator.h"
#include <gazebo_sfm_plugin/AssignTask.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <geometry_msgs/Point.h>
#include <ros/master.h>

TaskCoordinator::TaskCoordinator(ros::NodeHandle& nh) : nh_(nh)
{
    assign_task_service_ = nh_.advertiseService("assign_task", 
                                             &TaskCoordinator::assignTasks, 
                                             this);
    pedestrian_names_ = discoverPedestrians();
    ROS_INFO("Task Coordinator ready. Found %zu pedestrians.", pedestrian_names_.size());
}

std::vector<std::string> TaskCoordinator::discoverPedestrians()
{
    ros::master::V_TopicInfo topics;
    ros::master::getTopics(topics);
    std::vector<std::string> discovered;

    for(const auto& topic : topics)
    {
        size_t pos = topic.name.find("/update_waypoint");
        if(pos != std::string::npos)
        {
            std::string name = topic.name.substr(1, pos - 1);
            if(!name.empty()) discovered.push_back(name);
        }
    }
    return discovered;
}

bool TaskCoordinator::assignTasks(gazebo_sfm_plugin::AssignTask::Request& req,
                                gazebo_sfm_plugin::AssignTask::Response& res)
{
    pedestrian_names_ = discoverPedestrians();
    if(pedestrian_names_.empty())
    {
        ROS_WARN("No pedestrians available!");
        res.success = false;
        return true;
    }

    // Distribución de waypoints
    size_t total = req.waypoints.size();
    size_t per_ped = total / pedestrian_names_.size();
    size_t extra = total % pedestrian_names_.size();

    bool success = true;
    size_t idx = 0;

    for(size_t i = 0; i < pedestrian_names_.size(); ++i)
    {
        size_t count = per_ped + (i < extra ? 1 : 0);
        if(count == 0) continue;

        gazebo_sfm_plugin::Update_waypoint srv;
        srv.request.waypoints.assign(req.waypoints.begin() + idx,
                                   req.waypoints.begin() + idx + count);

        ros::ServiceClient client = nh_.serviceClient<gazebo_sfm_plugin::Update_waypoint>(
            "/" + pedestrian_names_[i] + "/update_waypoint");

        if(!client.call(srv) || !srv.response.success)
        {
            ROS_ERROR("Failed to assign tasks to %s", pedestrian_names_[i].c_str());
            success = false;
        }
        idx += count;
    }

    res.success = success;
    return true;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "task_coordinator");
    ros::NodeHandle nh;
    
    TaskCoordinator coordinator(nh);
    
    ros::spin();
    return 0;
}