;; Auto-generated. Do not edit!


(when (boundp 'gazebo_sfm_plugin::AssignTask)
  (if (not (find-package "GAZEBO_SFM_PLUGIN"))
    (make-package "GAZEBO_SFM_PLUGIN"))
  (shadow 'AssignTask (find-package "GAZEBO_SFM_PLUGIN")))
(unless (find-package "GAZEBO_SFM_PLUGIN::ASSIGNTASK")
  (make-package "GAZEBO_SFM_PLUGIN::ASSIGNTASK"))
(unless (find-package "GAZEBO_SFM_PLUGIN::ASSIGNTASKREQUEST")
  (make-package "GAZEBO_SFM_PLUGIN::ASSIGNTASKREQUEST"))
(unless (find-package "GAZEBO_SFM_PLUGIN::ASSIGNTASKRESPONSE")
  (make-package "GAZEBO_SFM_PLUGIN::ASSIGNTASKRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass gazebo_sfm_plugin::AssignTaskRequest
  :super ros::object
  :slots (_waypoints ))

(defmethod gazebo_sfm_plugin::AssignTaskRequest
  (:init
   (&key
    ((:waypoints __waypoints) ())
    )
   (send-super :init)
   (setq _waypoints __waypoints)
   self)
  (:waypoints
   (&rest __waypoints)
   (if (keywordp (car __waypoints))
       (send* _waypoints __waypoints)
     (progn
       (if __waypoints (setq _waypoints (car __waypoints)))
       _waypoints)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _waypoints
     (write-long (length _waypoints) s)
     (dolist (elem _waypoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _waypoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _waypoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::AssignTaskResponse
  :super ros::object
  :slots (_success ))

(defmethod gazebo_sfm_plugin::AssignTaskResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::AssignTask
  :super ros::object
  :slots ())

(setf (get gazebo_sfm_plugin::AssignTask :md5sum-) "e65fdf0b922727bc18f1f1772a8f5a15")
(setf (get gazebo_sfm_plugin::AssignTask :datatype-) "gazebo_sfm_plugin/AssignTask")
(setf (get gazebo_sfm_plugin::AssignTask :request) gazebo_sfm_plugin::AssignTaskRequest)
(setf (get gazebo_sfm_plugin::AssignTask :response) gazebo_sfm_plugin::AssignTaskResponse)

(defmethod gazebo_sfm_plugin::AssignTaskRequest
  (:response () (instance gazebo_sfm_plugin::AssignTaskResponse :init)))

(setf (get gazebo_sfm_plugin::AssignTaskRequest :md5sum-) "e65fdf0b922727bc18f1f1772a8f5a15")
(setf (get gazebo_sfm_plugin::AssignTaskRequest :datatype-) "gazebo_sfm_plugin/AssignTaskRequest")
(setf (get gazebo_sfm_plugin::AssignTaskRequest :definition-)
      "geometry_msgs/Point[] waypoints

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success
")

(setf (get gazebo_sfm_plugin::AssignTaskResponse :md5sum-) "e65fdf0b922727bc18f1f1772a8f5a15")
(setf (get gazebo_sfm_plugin::AssignTaskResponse :datatype-) "gazebo_sfm_plugin/AssignTaskResponse")
(setf (get gazebo_sfm_plugin::AssignTaskResponse :definition-)
      "geometry_msgs/Point[] waypoints

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success
")



(provide :gazebo_sfm_plugin/AssignTask "e65fdf0b922727bc18f1f1772a8f5a15")


