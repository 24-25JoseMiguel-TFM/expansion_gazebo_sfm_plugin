#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "gazebo_sfm_plugin/Update_waypoint.h"

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

class TaskRobotController {
public:
    TaskRobotController() : 
        ac_("move_base", true),
        nh_("~")
    {
        // Wait for the action server to come up
        while(!ac_.waitForServer(ros::Duration(5.0))) {
            ROS_INFO("Waiting for the move_base action server to come up");
        }

        // Get robot name from parameter
        nh_.param<std::string>("robot_name", robot_name_, "robot1");
        
        // Service client for receiving tasks
        task_service_ = nh_.advertiseService("/" + robot_name_ + "/task_assignment", 
                                           &TaskRobotController::handleTaskService, this);

        ROS_INFO("%s ready to receive tasks", robot_name_.c_str());
    }

    bool handleTaskService(gazebo_sfm_plugin::Update_waypoint::Request &req,
                         gazebo_sfm_plugin::Update_waypoint::Response &res) {
        if (req.waypoints.empty()) {
            ROS_WARN("Received empty waypoints");
            res.success = false;
            return true;
        }

        ROS_INFO("Received new task: %s with %zu waypoints", 
                req.task_name.c_str(), req.waypoints.size());

        // Process all waypoints sequentially
        for (const auto& waypoint : req.waypoints) {
            move_base_msgs::MoveBaseGoal move_goal;
            move_goal.target_pose.header.frame_id = "map";
            move_goal.target_pose.header.stamp = ros::Time::now();
            
            move_goal.target_pose.pose.position = waypoint;
            move_goal.target_pose.pose.orientation.w = 1.0; // Default orientation

            ROS_INFO("Moving to position: x=%.2f, y=%.2f", 
                    waypoint.x, waypoint.y);

            ac_.sendGoal(move_goal);
            ac_.waitForResult();

            if (ac_.getState() != actionlib::SimpleClientGoalState::SUCCEEDED) {
                ROS_WARN("Failed to reach waypoint");
                res.success = false;
                return true;
            }
        }

        ROS_INFO("Completed task: %s", req.task_name.c_str());

        //Returns to initial position

        ROS_INFO("Returning to initial position");

        move_base_msgs::MoveBaseGoal init;
        init.target_pose.header.frame_id = "map";
        init.target_pose.header.stamp = ros::Time::now();
        init.target_pose.pose.position.x = 6.98;
        init.target_pose.pose.position.y = -4.2;
        init.target_pose.pose.orientation.w = 1.0; // Default orientation
        
        ac_.sendGoal(init);
        ac_.waitForResult();
       
        res.success = true;
        return true;
    }

private:
    ros::NodeHandle nh_;
    MoveBaseClient ac_;
    ros::ServiceServer task_service_;
    std::string robot_name_;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "task_robot_controller");
    TaskRobotController controller;
    ros::spin();
    return 0;
}