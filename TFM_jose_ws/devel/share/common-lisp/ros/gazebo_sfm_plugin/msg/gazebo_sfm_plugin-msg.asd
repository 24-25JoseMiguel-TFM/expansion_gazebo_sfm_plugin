
(cl:in-package :asdf)

(defsystem "gazebo_sfm_plugin-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Task" :depends-on ("_package_Task"))
    (:file "_package_Task" :depends-on ("_package"))
    (:file "TaskAssignmentAction" :depends-on ("_package_TaskAssignmentAction"))
    (:file "_package_TaskAssignmentAction" :depends-on ("_package"))
    (:file "TaskAssignmentActionFeedback" :depends-on ("_package_TaskAssignmentActionFeedback"))
    (:file "_package_TaskAssignmentActionFeedback" :depends-on ("_package"))
    (:file "TaskAssignmentActionGoal" :depends-on ("_package_TaskAssignmentActionGoal"))
    (:file "_package_TaskAssignmentActionGoal" :depends-on ("_package"))
    (:file "TaskAssignmentActionResult" :depends-on ("_package_TaskAssignmentActionResult"))
    (:file "_package_TaskAssignmentActionResult" :depends-on ("_package"))
    (:file "TaskAssignmentFeedback" :depends-on ("_package_TaskAssignmentFeedback"))
    (:file "_package_TaskAssignmentFeedback" :depends-on ("_package"))
    (:file "TaskAssignmentGoal" :depends-on ("_package_TaskAssignmentGoal"))
    (:file "_package_TaskAssignmentGoal" :depends-on ("_package"))
    (:file "TaskAssignmentResult" :depends-on ("_package_TaskAssignmentResult"))
    (:file "_package_TaskAssignmentResult" :depends-on ("_package"))
  ))