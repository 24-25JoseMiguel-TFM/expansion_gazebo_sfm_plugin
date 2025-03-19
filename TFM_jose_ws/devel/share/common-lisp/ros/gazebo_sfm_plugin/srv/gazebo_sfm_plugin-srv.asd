
(cl:in-package :asdf)

(defsystem "gazebo_sfm_plugin-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Update_waypoint" :depends-on ("_package_Update_waypoint"))
    (:file "_package_Update_waypoint" :depends-on ("_package"))
  ))