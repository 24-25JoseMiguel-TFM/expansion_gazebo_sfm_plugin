#include "gazebo_sfm_plugin/TaskCoordinator.h"
#include <fstream>
#include <yaml-cpp/yaml.h>
#include <cstddef>
#include "gazebo_sfm_plugin/Update_waypoint.h"

namespace gazebo_sfm_plugin {

TaskCoordinator::TaskCoordinator(ros::NodeHandle& nh) : 
    nh_(nh),
    as_(nh_, "task_assignment", boost::bind(&TaskCoordinator::executeTaskAssignment, this, _1), false)
{
    // Initialize parameters
    nh_.param("num_pedestrians", num_pedestrians_, 2);
    nh_.param("num_robots", num_robots_, 1);
    
    // Initialize pedestrian and robot names
    for (int i = 1; i <= num_pedestrians_; ++i) {
        pedestrian_names_.push_back("actor" + std::to_string(i));
    }
    for (int i = 1; i <= num_robots_; ++i) {
        robot_names_.push_back("robot" + std::to_string(i));
    }
    
    // Initialize services
    load_tasks_service_ = nh_.advertiseService("load_tasks", &TaskCoordinator::loadTasksCallback, this);
    
    // Start action server
    as_.start();
    
    ROS_INFO("Task Coordinator initialized with %d pedestrians and %d robots", num_pedestrians_, num_robots_);
}

bool TaskCoordinator::loadTasksFromFile(const std::string& file_path) {
    tasks_.clear();

    try {
        YAML::Node config = YAML::LoadFile(file_path);

        for (const auto& task_node : config["tasks"]) {
            Task new_task;
            new_task.name = task_node["name"].as<std::string>();
            new_task.x_humans = task_node["x_humans"].as<double>();
            new_task.y_humans = task_node["y_humans"].as<double>();
            new_task.x_robots = task_node["x_robots"].as<double>();
            new_task.y_robots = task_node["y_robots"].as<double>();
            new_task.for_humans = task_node["for_humans"].as<bool>();
            new_task.for_robots = task_node["for_robots"].as<bool>();
            new_task.completed = false;
            tasks_.push_back(new_task);
        }

        ROS_INFO("Loaded %lu tasks from file.", tasks_.size());
        return true;
    } catch (const YAML::Exception& e) {
        ROS_ERROR("Error reading task file: %s", e.what());
        return false;
    }
}

bool TaskCoordinator::loadTasksCallback(gazebo_sfm_plugin::LoadTasks::Request &req,
                                      gazebo_sfm_plugin::LoadTasks::Response &res)
{
    if (req.use_file) {
        if (!loadTasksFromFile(req.file_path)) {
            res.success = false;
            res.message = "Failed to load tasks from file";
            return false;
        }
    } else {
        // Clear existing tasks
        tasks_.clear();
        
        // Load new tasks with the new structure
        for (size_t i = 0; i < req.task_names.size(); ++i) {
            Task new_task;
            new_task.name = req.task_names[i];
            new_task.x_humans = req.x_humans[i];
            new_task.y_humans = req.y_humans[i];
            new_task.x_robots = req.x_robots[i];
            new_task.y_robots = req.y_robots[i];
            new_task.for_humans = req.for_humans[i];
            new_task.for_robots = req.for_robots[i];
            new_task.completed = false;
            tasks_.push_back(new_task);
        }
    }
    
    // Distribute tasks among available agents
    distributeTasks();
    
    res.success = true;
    res.message = "Successfully loaded " + std::to_string(tasks_.size()) + " tasks";
    return true;
}

void TaskCoordinator::distributeTasks()
{
    // Simple round-robin distribution algorithm
    size_t ped_index = 0;
    size_t robot_index = 0;
    
    for (auto& task : tasks_) {
        if (task.completed) continue;
        
        if (task.for_humans) {
            if (!pedestrian_names_.empty()) {
                std::string pedestrian = pedestrian_names_[ped_index % pedestrian_names_.size()];
                geometry_msgs::Point human_position;
                human_position.x = task.x_humans;
                human_position.y = task.y_humans;
                human_position.z = 0;
                
                if (sendTaskToPedestrian(pedestrian, human_position)) {
                    ROS_INFO("Assigned task %s to pedestrian %s", task.name.c_str(), pedestrian.c_str());
                    ped_index++;
                    task.completed = true;
                    continue;
                }
            }
        }
        
        if (task.for_robots) {
            if (!robot_names_.empty()) {
                std::string robot = robot_names_[robot_index % robot_names_.size()];
                geometry_msgs::Point robot_position;
                robot_position.x = task.x_robots;
                robot_position.y = task.y_robots;
                robot_position.z = 0;
                
                if (sendTaskToRobot(robot, robot_position)) {
                    ROS_INFO("Assigned task %s to robot %s", task.name.c_str(), robot.c_str());
                    robot_index++;
                    task.completed = true;
                    continue;
                }
            }
        }
    }
}

bool TaskCoordinator::sendTaskToPedestrian(const std::string& pedestrian_name, 
                                         const geometry_msgs::Point& position) {
    actionlib::SimpleActionClient<gazebo_sfm_plugin::TaskAssignmentAction> client(
        nh_, "/" + pedestrian_name + "/task_assignment", true);
    
    if (!client.waitForServer(ros::Duration(2.0))) {
        ROS_ERROR("Failed to connect to action server for pedestrian %s", 
                pedestrian_name.c_str());
        return false;
    }
    
    gazebo_sfm_plugin::TaskAssignmentGoal goal;
    goal.positions.push_back(position);
    
    client.sendGoal(goal);
    
    bool finished = client.waitForResult(ros::Duration(5.0));
    if (finished) {
        actionlib::SimpleClientGoalState state = client.getState();
        if (state == actionlib::SimpleClientGoalState::SUCCEEDED) {
            return true;
        }
        ROS_WARN("Task assignment to pedestrian %s failed with state: %s",
                pedestrian_name.c_str(), state.toString().c_str());
        return false;
    }
    
    ROS_WARN("Task assignment to pedestrian %s timed out", pedestrian_name.c_str());
    return false;
}

bool TaskCoordinator::sendTaskToRobot(const std::string& robot_name, 
                                    const geometry_msgs::Point& position) {
    ros::ServiceClient client = nh_.serviceClient<gazebo_sfm_plugin::Update_waypoint>(
        "/" + robot_name + "/update_waypoint");
    
    gazebo_sfm_plugin::Update_waypoint srv;
    geometry_msgs::Point waypoint;
    waypoint.x = position.x;
    waypoint.y = position.y;
    waypoint.z = 0.0;
    srv.request.waypoints.push_back(waypoint);
    
    if (client.call(srv)) {
        return srv.response.success;
    } else {
        ROS_ERROR("Failed to call service update_waypoint for robot %s", 
                 robot_name.c_str());
        return false;
    }
}

void TaskCoordinator::executeTaskAssignment(const gazebo_sfm_plugin::TaskAssignmentGoalConstPtr &goal)
{
    gazebo_sfm_plugin::TaskAssignmentFeedback feedback;
    gazebo_sfm_plugin::TaskAssignmentResult result;
    
    bool success = true;
    
    feedback.percent_complete = 0.0;
    as_.publishFeedback(feedback);
    
    for (int i = 1; i <= 10; ++i) {
        ros::Duration(0.1).sleep();
        feedback.percent_complete = i * 10;
        as_.publishFeedback(feedback);
    }
    
    result.success = success;
    result.message = success ? "Task assignment completed successfully" : "Task assignment failed";
    
    if (success) {
        as_.setSucceeded(result);
    } else {
        as_.setAborted(result);
    }
}

} // namespace gazebo_sfm_plugin

int main(int argc, char** argv)
{
    ros::init(argc, argv, "task_coordinator");
    ros::NodeHandle nh("~");
    
    gazebo_sfm_plugin::TaskCoordinator coordinator(nh);
    
    ros::spin();
    return 0;
}