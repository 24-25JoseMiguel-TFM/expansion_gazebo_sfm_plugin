#ifndef TASK_COORDINATOR_H
#define TASK_COORDINATOR_H

#include <ros/ros.h>
#include <gazebo_sfm_plugin/AssignTask.h>
#include <vector>
#include <string>

class TaskCoordinator
{
public:
    TaskCoordinator(ros::NodeHandle& nh);
    
    bool assignTasks(gazebo_sfm_plugin::AssignTask::Request& req,
                   gazebo_sfm_plugin::AssignTask::Response& res);  // ¡Nombre exacto!

private:
    ros::ServiceServer assign_task_service_;  // Miembro añadido
    ros::NodeHandle nh_;
    std::vector<std::string> pedestrian_names_;
    
    std::vector<std::string> discoverPedestrians();  // Tipo de retorno cambiado
};

#endif