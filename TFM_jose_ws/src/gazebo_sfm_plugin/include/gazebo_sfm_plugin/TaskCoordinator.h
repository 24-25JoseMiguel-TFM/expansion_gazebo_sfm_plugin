#ifndef GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H
#define GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H

#include <ros/ros.h>
#include <gazebo_sfm_plugin/LoadTasks.h>
#include <gazebo_sfm_plugin/Update_waypoint.h>
#include <geometry_msgs/Point.h>
#include <vector>
#include <string>
#include <map>

namespace gazebo_sfm_plugin {

class TaskCoordinator
{
public:
    TaskCoordinator(ros::NodeHandle& nh);
    
private:
    struct Task {
        std::string name;
        double x_humans;
        double y_humans;
        double x_robots;  // Nuevo campo para robots
        double y_robots;  // Nuevo campo para robots
        bool for_humans;
        bool for_robots;  // Nuevo campo para robots
        bool completed;
        bool assigned;
        std::string assigned_to;
    };
    
    bool loadTasksCallback(gazebo_sfm_plugin::LoadTasks::Request &req,
                         gazebo_sfm_plugin::LoadTasks::Response &res);
    
    bool loadTasksFromFile(const std::string& file_path);
    void distributeTasks();
    
    // Método modificado para aceptar múltiples waypoints
    bool sendTaskByServiceActor(const std::string& pedestrian_name,
                         const std::vector<geometry_msgs::Point>& positions,
                         const std::string& task_name);

    bool sendTaskByServiceRobot(const std::string& robot_name,
                        const std::vector<geometry_msgs::Point>& positions,
                        const std::string& task_name);

    ros::NodeHandle nh_;
    ros::ServiceServer load_tasks_service_;

    std::vector<Task> tasks_;
    std::vector<std::string> pedestrian_names_;
    
    int num_pedestrians_;

    std::vector<std::string> robot_names_;
    
    int num_robots_;
};

} // namespace gazebo_sfm_plugin

#endif // GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H