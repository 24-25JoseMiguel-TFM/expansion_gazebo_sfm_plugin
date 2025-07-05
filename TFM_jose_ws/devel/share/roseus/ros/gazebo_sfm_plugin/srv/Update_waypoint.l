;; Auto-generated. Do not edit!


(when (boundp 'gazebo_sfm_plugin::Update_waypoint)
  (if (not (find-package "GAZEBO_SFM_PLUGIN"))
    (make-package "GAZEBO_SFM_PLUGIN"))
  (shadow 'Update_waypoint (find-package "GAZEBO_SFM_PLUGIN")))
(unless (find-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINT")
  (make-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINT"))
(unless (find-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINTREQUEST")
  (make-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINTREQUEST"))
(unless (find-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINTRESPONSE")
  (make-package "GAZEBO_SFM_PLUGIN::UPDATE_WAYPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass gazebo_sfm_plugin::Update_waypointRequest
  :super ros::object
  :slots (_waypoints _task_name ))

(defmethod gazebo_sfm_plugin::Update_waypointRequest
  (:init
   (&key
    ((:waypoints __waypoints) ())
    ((:task_name __task_name) "")
    )
   (send-super :init)
   (setq _waypoints __waypoints)
   (setq _task_name (string __task_name))
   self)
  (:waypoints
   (&rest __waypoints)
   (if (keywordp (car __waypoints))
       (send* _waypoints __waypoints)
     (progn
       (if __waypoints (setq _waypoints (car __waypoints)))
       _waypoints)))
  (:task_name
   (&optional __task_name)
   (if __task_name (setq _task_name __task_name)) _task_name)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ;; string _task_name
    4 (length _task_name)
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
     ;; string _task_name
       (write-long (length _task_name) s) (princ _task_name s)
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
   ;; string _task_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _task_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::Update_waypointResponse
  :super ros::object
  :slots (_success ))

(defmethod gazebo_sfm_plugin::Update_waypointResponse
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

(defclass gazebo_sfm_plugin::Update_waypoint
  :super ros::object
  :slots ())

(setf (get gazebo_sfm_plugin::Update_waypoint :md5sum-) "f5dd19960de228b666941d1879a83836")
(setf (get gazebo_sfm_plugin::Update_waypoint :datatype-) "gazebo_sfm_plugin/Update_waypoint")
(setf (get gazebo_sfm_plugin::Update_waypoint :request) gazebo_sfm_plugin::Update_waypointRequest)
(setf (get gazebo_sfm_plugin::Update_waypoint :response) gazebo_sfm_plugin::Update_waypointResponse)

(defmethod gazebo_sfm_plugin::Update_waypointRequest
  (:response () (instance gazebo_sfm_plugin::Update_waypointResponse :init)))

(setf (get gazebo_sfm_plugin::Update_waypointRequest :md5sum-) "f5dd19960de228b666941d1879a83836")
(setf (get gazebo_sfm_plugin::Update_waypointRequest :datatype-) "gazebo_sfm_plugin/Update_waypointRequest")
(setf (get gazebo_sfm_plugin::Update_waypointRequest :definition-)
      "geometry_msgs/Point[] waypoints
string task_name

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success  # Respuesta: true si la trayectoria se actualizo correctamente
")

(setf (get gazebo_sfm_plugin::Update_waypointResponse :md5sum-) "f5dd19960de228b666941d1879a83836")
(setf (get gazebo_sfm_plugin::Update_waypointResponse :datatype-) "gazebo_sfm_plugin/Update_waypointResponse")
(setf (get gazebo_sfm_plugin::Update_waypointResponse :definition-)
      "geometry_msgs/Point[] waypoints
string task_name

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success  # Respuesta: true si la trayectoria se actualizo correctamente
")



(provide :gazebo_sfm_plugin/Update_waypoint "f5dd19960de228b666941d1879a83836")


