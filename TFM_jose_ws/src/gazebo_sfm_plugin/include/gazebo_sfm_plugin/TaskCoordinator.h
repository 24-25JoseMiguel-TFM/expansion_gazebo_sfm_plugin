#ifndef GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H
#define GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H

#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/server/simple_action_server.h>
#include <gazebo_sfm_plugin/TaskAssignmentAction.h>
#include <gazebo_sfm_plugin/LoadTasks.h>
#include <geometry_msgs/Point.h>
#include <vector>
#include <string>

namespace gazebo_sfm_plugin {

class TaskCoordinator
{
public:
    TaskCoordinator(ros::NodeHandle& nh);
    
private:
    // Task structure
    struct Task {
        std::string name;
        double x_humans;
        double y_humans;
        double x_robots;
        double y_robots;
        bool for_humans;
        bool for_robots;
        bool completed;
    };
    
    // Service callback to load tasks
    bool loadTasksCallback(gazebo_sfm_plugin::LoadTasks::Request &req,
                         gazebo_sfm_plugin::LoadTasks::Response &res);
    
    // Load tasks from YAML file
    bool loadTasksFromFile(const std::string& file_path);
    
    // Action server callbacks
    void executeTaskAssignment(const gazebo_sfm_plugin::TaskAssignmentGoalConstPtr &goal);
    
    // Distribute tasks among available agents
    void distributeTasks();
    
    // Send task to a pedestrian
    bool sendTaskToPedestrian(const std::string& pedestrian_name, 
                            const geometry_msgs::Point& position);
    
    // Send task to a robot
    bool sendTaskToRobot(const std::string& robot_name,
                       const geometry_msgs::Point& position);
    
    // ROS components
    ros::NodeHandle nh_;
    ros::ServiceServer load_tasks_service_;
    actionlib::SimpleActionServer<gazebo_sfm_plugin::TaskAssignmentAction> as_;

    // Task management
    std::vector<Task> tasks_;
    std::vector<std::string> pedestrian_names_;
    std::vector<std::string> robot_names_;
    
    // Configuration
    int num_pedestrians_;
    int num_robots_;
};

} // namespace gazebo_sfm_plugin

#endif // GAZEBO_SFM_PLUGIN_TASK_COORDINATOR_H