;; Auto-generated. Do not edit!


(when (boundp 'gazebo_sfm_plugin::LoadTasks)
  (if (not (find-package "GAZEBO_SFM_PLUGIN"))
    (make-package "GAZEBO_SFM_PLUGIN"))
  (shadow 'LoadTasks (find-package "GAZEBO_SFM_PLUGIN")))
(unless (find-package "GAZEBO_SFM_PLUGIN::LOADTASKS")
  (make-package "GAZEBO_SFM_PLUGIN::LOADTASKS"))
(unless (find-package "GAZEBO_SFM_PLUGIN::LOADTASKSREQUEST")
  (make-package "GAZEBO_SFM_PLUGIN::LOADTASKSREQUEST"))
(unless (find-package "GAZEBO_SFM_PLUGIN::LOADTASKSRESPONSE")
  (make-package "GAZEBO_SFM_PLUGIN::LOADTASKSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass gazebo_sfm_plugin::LoadTasksRequest
  :super ros::object
  :slots (_use_file _file_path _task_names _positions _target_types ))

(defmethod gazebo_sfm_plugin::LoadTasksRequest
  (:init
   (&key
    ((:use_file __use_file) nil)
    ((:file_path __file_path) "")
    ((:task_names __task_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:positions __positions) ())
    ((:target_types __target_types) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _use_file __use_file)
   (setq _file_path (string __file_path))
   (setq _task_names __task_names)
   (setq _positions __positions)
   (setq _target_types __target_types)
   self)
  (:use_file
   (&optional (__use_file :null))
   (if (not (eq __use_file :null)) (setq _use_file __use_file)) _use_file)
  (:file_path
   (&optional __file_path)
   (if __file_path (setq _file_path __file_path)) _file_path)
  (:task_names
   (&optional __task_names)
   (if __task_names (setq _task_names __task_names)) _task_names)
  (:positions
   (&rest __positions)
   (if (keywordp (car __positions))
       (send* _positions __positions)
     (progn
       (if __positions (setq _positions (car __positions)))
       _positions)))
  (:target_types
   (&optional __target_types)
   (if __target_types (setq _target_types __target_types)) _target_types)
  (:serialization-length
   ()
   (+
    ;; bool _use_file
    1
    ;; string _file_path
    4 (length _file_path)
    ;; string[] _task_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _task_names)) 4
    ;; geometry_msgs/Point[] _positions
    (apply #'+ (send-all _positions :serialization-length)) 4
    ;; string[] _target_types
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _target_types)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _use_file
       (if _use_file (write-byte -1 s) (write-byte 0 s))
     ;; string _file_path
       (write-long (length _file_path) s) (princ _file_path s)
     ;; string[] _task_names
     (write-long (length _task_names) s)
     (dolist (elem _task_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; geometry_msgs/Point[] _positions
     (write-long (length _positions) s)
     (dolist (elem _positions)
       (send elem :serialize s)
       )
     ;; string[] _target_types
     (write-long (length _target_types) s)
     (dolist (elem _target_types)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _use_file
     (setq _use_file (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _file_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _task_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _task_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _task_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; geometry_msgs/Point[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _target_types
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _target_types (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _target_types i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::LoadTasksResponse
  :super ros::object
  :slots (_success _message ))

(defmethod gazebo_sfm_plugin::LoadTasksResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::LoadTasks
  :super ros::object
  :slots ())

(setf (get gazebo_sfm_plugin::LoadTasks :md5sum-) "3b67f7d0c861348ae151a1487a64fe7e")
(setf (get gazebo_sfm_plugin::LoadTasks :datatype-) "gazebo_sfm_plugin/LoadTasks")
(setf (get gazebo_sfm_plugin::LoadTasks :request) gazebo_sfm_plugin::LoadTasksRequest)
(setf (get gazebo_sfm_plugin::LoadTasks :response) gazebo_sfm_plugin::LoadTasksResponse)

(defmethod gazebo_sfm_plugin::LoadTasksRequest
  (:response () (instance gazebo_sfm_plugin::LoadTasksResponse :init)))

(setf (get gazebo_sfm_plugin::LoadTasksRequest :md5sum-) "3b67f7d0c861348ae151a1487a64fe7e")
(setf (get gazebo_sfm_plugin::LoadTasksRequest :datatype-) "gazebo_sfm_plugin/LoadTasksRequest")
(setf (get gazebo_sfm_plugin::LoadTasksRequest :definition-)
      "bool use_file
string file_path
string[] task_names
geometry_msgs/Point[] positions
string[] target_types

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success
string message
")

(setf (get gazebo_sfm_plugin::LoadTasksResponse :md5sum-) "3b67f7d0c861348ae151a1487a64fe7e")
(setf (get gazebo_sfm_plugin::LoadTasksResponse :datatype-) "gazebo_sfm_plugin/LoadTasksResponse")
(setf (get gazebo_sfm_plugin::LoadTasksResponse :definition-)
      "bool use_file
string file_path
string[] task_names
geometry_msgs/Point[] positions
string[] target_types

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
bool success
string message
")



(provide :gazebo_sfm_plugin/LoadTasks "3b67f7d0c861348ae151a1487a64fe7e")


