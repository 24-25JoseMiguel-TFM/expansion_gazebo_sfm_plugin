
(cl:in-package :asdf)

(defsystem "gazebo_sfm_plugin-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "LoadTasks" :depends-on ("_package_LoadTasks"))
    (:file "_package_LoadTasks" :depends-on ("_package"))
    (:file "Return_home" :depends-on ("_package_Return_home"))
    (:file "_package_Return_home" :depends-on ("_package"))
    (:file "Update_waypoint" :depends-on ("_package_Update_waypoint"))
    (:file "_package_Update_waypoint" :depends-on ("_package"))
  ))