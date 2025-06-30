#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <gazebo_sfm_plugin/TaskAssignmentAction.h>
#include <geometry_msgs/PoseStamped.h>

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

        // Subscribe to task assignments
        task_sub_ = nh_.subscribe("/task_assignment/goal", 10, &TaskRobotController::taskCallback, this);

        ROS_INFO("Task Robot Controller ready to receive tasks");
    }

    void taskCallback(const gazebo_sfm_plugin::TaskAssignmentGoalConstPtr& goal) {
        if (goal->positions.empty()) {
            ROS_WARN("Received empty task assignment");
            return;
        }

        // For simplicity, we'll just use the first position in the array
        // You may want to implement more sophisticated task selection logic
        const auto& target_pos = goal->positions[0];
        
        ROS_INFO("Received new task with %zu positions", goal->positions.size());

        move_base_msgs::MoveBaseGoal move_goal;

        // Set up the frame parameters
        move_goal.target_pose.header.frame_id = "map";
        move_goal.target_pose.header.stamp = ros::Time::now();

        // Use the first position from the task
        move_goal.target_pose.pose.position = target_pos;
        
        // Default orientation - face forward
        move_goal.target_pose.pose.orientation.w = 1.0;

        ROS_INFO("Sending robot to position: x=%f, y=%f", 
                move_goal.target_pose.pose.position.x,
                move_goal.target_pose.pose.position.y);

        ac_.sendGoal(move_goal);

        // Wait for the action to return
        ac_.waitForResult();

        if (ac_.getState() == actionlib::SimpleClientGoalState::SUCCEEDED) {
            ROS_INFO("Robot successfully reached the goal!");
        } else {
            ROS_WARN("The robot failed to reach the goal for some reason");
        }
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber task_sub_;
    MoveBaseClient ac_;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "task_robot_controller");
    
    ROS_INFO("EL ROBOT ESTA LISTO");  // Añadido el mensaje de aviso
    
    TaskRobotController controller;

    ros::spin();
    return 0;
}