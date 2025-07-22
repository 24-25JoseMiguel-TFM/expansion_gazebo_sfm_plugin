#include "gazebo_sfm_plugin/TaskCoordinator.h"
#include <fstream>
#include <yaml-cpp/yaml.h>
#include "gazebo_sfm_plugin/Update_waypoint.h"

namespace gazebo_sfm_plugin {
 
TaskCoordinator::TaskCoordinator(ros::NodeHandle& nh) : nh_(nh) {
    nh_.param("num_pedestrians", num_pedestrians_, 3); // Default to 3 pedestrians
    nh_.param("num_robots", num_robots_,1); // Default to 1 robot
    for (int i = 1; i <= num_pedestrians_; ++i)
        pedestrian_names_.push_back("actor" + std::to_string(i));

    for (int i = 1; i <= num_robots_; ++i)
    
        robot_names_.push_back("robot" + std::to_string(i));

    load_tasks_service_ = nh_.advertiseService("load_tasks", &TaskCoordinator::loadTasksCallback, this);

    ROS_INFO("Task Coordinator initialized with %d pedestrians and %d robots", num_pedestrians_,num_robots_);
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
                                      gazebo_sfm_plugin::LoadTasks::Response &res) {
    if (req.use_file) {
        if (!loadTasksFromFile(req.file_path)) {
            res.success = false;
            res.message = "Failed to load tasks from file";
            return false;
        }
    } else {
        tasks_.clear();
        for (size_t i = 0; i < req.task_names.size(); ++i) {
            Task new_task;
            new_task.name = req.task_names[i];
            new_task.x_humans = req.x_humans[i];
            new_task.y_humans = req.y_humans[i];
            new_task.for_humans = req.for_humans[i];
            new_task.x_robots = req.x_robots[i];
            new_task.y_robots= req.y_robots[i];
            new_task.for_robots = req.for_robots[i];
            tasks_.push_back(new_task);
        }
    }
    distributeTasks();
    res.success = true;
    res.message = "Successfully loaded " + std::to_string(tasks_.size()) + " tasks";
    return true;
}

void TaskCoordinator::distributeTasks() {

    std::map<std::string, std::vector<geometry_msgs::Point>> actor_waypoints;
    std::map<std::string, std::string> actor_tasks;
    std::map<std::string, std::vector<geometry_msgs::Point>> robot_waypoints;
    std::map<std::string, std::string> robot_tasks;

    size_t current_actor_index = 0;
    size_t current_robot_index = 0;
    bool next_is_robot = true;

    for (auto& task : tasks_) {

        if (task.for_humans && task.for_robots) {
            // Tarea para ambos: alternamos
            if (next_is_robot) {
                
                std::string robot = robot_names_[current_robot_index];
                geometry_msgs::Point pos;
                pos.x = task.x_robots;
                pos.y = task.y_robots;
                pos.z = 0;
                
                robot_waypoints[robot].push_back(pos);
                robot_tasks[robot] += task.name + " ";
                current_robot_index = (current_robot_index + 1) % robot_names_.size();
            } else {
                // Asignar a humano
                
                std::string pedestrian = pedestrian_names_[current_actor_index];
                geometry_msgs::Point pos;
                pos.x = task.x_humans;
                pos.y = task.y_humans;
                pos.z = 0;
                
                actor_waypoints[pedestrian].push_back(pos);
                actor_tasks[pedestrian] += task.name + " ";
                task.assigned = true;
                task.assigned_to = pedestrian;
                current_actor_index = (current_actor_index + 1) % pedestrian_names_.size();
            }
            next_is_robot = !next_is_robot; // Alternar para la próxima tarea mixta
        } 
        else if (task.for_humans) {
            // Solo para humanos
            std::string pedestrian = pedestrian_names_[current_actor_index];
            geometry_msgs::Point pos;
            pos.x = task.x_humans;
            pos.y = task.y_humans;
            pos.z = 0;
            
            actor_waypoints[pedestrian].push_back(pos);
            actor_tasks[pedestrian] += task.name + " ";
            current_actor_index = (current_actor_index + 1) % pedestrian_names_.size();
        }
        else if (task.for_robots) {
            // Solo para robots
            std::string robot = robot_names_[current_robot_index];
            geometry_msgs::Point pos;
            pos.x = task.x_robots;
            pos.y = task.y_robots;
            pos.z = 0;
            
            robot_waypoints[robot].push_back(pos);
            robot_tasks[robot] += task.name + " ";
            task.assigned = true;
            task.assigned_to = robot;
            current_robot_index = (current_robot_index + 1) % robot_names_.size();
        }
    }
    
    // Luego enviar todos los waypoints de cada actor de una vez
    for (const auto& entry : actor_waypoints) {
        if (sendTaskByServiceActor(entry.first, entry.second, actor_tasks[entry.first])) {
            ROS_INFO("Assigned tasks '%s' to pedestrian %s with %zu waypoints", 
                    actor_tasks[entry.first].c_str(),
                    entry.first.c_str(),
                    entry.second.size());
        }
    }

    // Luego enviar todos los waypoints de robot de una vez
    for (const auto& entry : robot_waypoints) {
        if (sendTaskByServiceRobot(entry.first, entry.second, robot_tasks[entry.first])) {
            ROS_INFO("Assigned tasks '%s' to robot %s with %zu waypoints", 
                    robot_tasks[entry.first].c_str(),
                    entry.first.c_str(),
                    entry.second.size());
        }
    }

}

bool TaskCoordinator::sendTaskByServiceActor(const std::string& pedestrian_name,
                                      const std::vector<geometry_msgs::Point>& positions,
                                      const std::string& task_name) {
    ros::ServiceClient client = nh_.serviceClient<gazebo_sfm_plugin::Update_waypoint>(
        "/" + pedestrian_name + "/update_waypoint");

    gazebo_sfm_plugin::Update_waypoint srv;
    srv.request.waypoints = positions; // Todos los waypoints de una vez
    srv.request.task_name = task_name;

    return client.call(srv) && srv.response.success;
}


bool TaskCoordinator::sendTaskByServiceRobot(const std::string& robot_name,
                                      const std::vector<geometry_msgs::Point>& positions,
                                      const std::string& task_name) {
    ros::ServiceClient client = nh_.serviceClient<gazebo_sfm_plugin::Update_waypoint>(
        "/" + robot_name + "/task_assignment");

    gazebo_sfm_plugin::Update_waypoint srv;
    srv.request.waypoints = positions; // Todos los waypoints de una vez
    srv.request.task_name = task_name;

    return client.call(srv) && srv.response.success;
}


} // namespace gazebo_sfm_plugin

int main(int argc, char** argv) {
    ros::init(argc, argv, "task_coordinator");
    ros::NodeHandle nh("~");
    gazebo_sfm_plugin::TaskCoordinator coordinator(nh);
    ros::spin();
    return 0;
}