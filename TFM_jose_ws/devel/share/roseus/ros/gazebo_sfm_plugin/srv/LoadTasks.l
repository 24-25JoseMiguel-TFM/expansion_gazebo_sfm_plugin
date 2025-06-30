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





(defclass gazebo_sfm_plugin::LoadTasksRequest
  :super ros::object
  :slots (_task_names _x_humans _y_humans _x_robots _y_robots _for_humans _for_robots _use_file _file_path ))

(defmethod gazebo_sfm_plugin::LoadTasksRequest
  (:init
   (&key
    ((:task_names __task_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:x_humans __x_humans) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y_humans __y_humans) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:x_robots __x_robots) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y_robots __y_robots) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:for_humans __for_humans) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:for_robots __for_robots) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:use_file __use_file) nil)
    ((:file_path __file_path) "")
    )
   (send-super :init)
   (setq _task_names __task_names)
   (setq _x_humans __x_humans)
   (setq _y_humans __y_humans)
   (setq _x_robots __x_robots)
   (setq _y_robots __y_robots)
   (setq _for_humans __for_humans)
   (setq _for_robots __for_robots)
   (setq _use_file __use_file)
   (setq _file_path (string __file_path))
   self)
  (:task_names
   (&optional __task_names)
   (if __task_names (setq _task_names __task_names)) _task_names)
  (:x_humans
   (&optional __x_humans)
   (if __x_humans (setq _x_humans __x_humans)) _x_humans)
  (:y_humans
   (&optional __y_humans)
   (if __y_humans (setq _y_humans __y_humans)) _y_humans)
  (:x_robots
   (&optional __x_robots)
   (if __x_robots (setq _x_robots __x_robots)) _x_robots)
  (:y_robots
   (&optional __y_robots)
   (if __y_robots (setq _y_robots __y_robots)) _y_robots)
  (:for_humans
   (&optional __for_humans)
   (if __for_humans (setq _for_humans __for_humans)) _for_humans)
  (:for_robots
   (&optional __for_robots)
   (if __for_robots (setq _for_robots __for_robots)) _for_robots)
  (:use_file
   (&optional (__use_file :null))
   (if (not (eq __use_file :null)) (setq _use_file __use_file)) _use_file)
  (:file_path
   (&optional __file_path)
   (if __file_path (setq _file_path __file_path)) _file_path)
  (:serialization-length
   ()
   (+
    ;; string[] _task_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _task_names)) 4
    ;; float64[] _x_humans
    (* 8    (length _x_humans)) 4
    ;; float64[] _y_humans
    (* 8    (length _y_humans)) 4
    ;; float64[] _x_robots
    (* 8    (length _x_robots)) 4
    ;; float64[] _y_robots
    (* 8    (length _y_robots)) 4
    ;; bool[] _for_humans
    (* 1    (length _for_humans)) 4
    ;; bool[] _for_robots
    (* 1    (length _for_robots)) 4
    ;; bool _use_file
    1
    ;; string _file_path
    4 (length _file_path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _task_names
     (write-long (length _task_names) s)
     (dolist (elem _task_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _x_humans
     (write-long (length _x_humans) s)
     (dotimes (i (length _x_humans))
       (sys::poke (elt _x_humans i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _y_humans
     (write-long (length _y_humans) s)
     (dotimes (i (length _y_humans))
       (sys::poke (elt _y_humans i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _x_robots
     (write-long (length _x_robots) s)
     (dotimes (i (length _x_robots))
       (sys::poke (elt _x_robots i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _y_robots
     (write-long (length _y_robots) s)
     (dotimes (i (length _y_robots))
       (sys::poke (elt _y_robots i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool[] _for_humans
     (write-long (length _for_humans) s)
     (dotimes (i (length _for_humans))
       (if (elt _for_humans i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[] _for_robots
     (write-long (length _for_robots) s)
     (dotimes (i (length _for_robots))
       (if (elt _for_robots i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool _use_file
       (if _use_file (write-byte -1 s) (write-byte 0 s))
     ;; string _file_path
       (write-long (length _file_path) s) (princ _file_path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _task_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _task_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _task_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _x_humans
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x_humans (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x_humans i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _y_humans
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y_humans (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y_humans i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _x_robots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x_robots (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x_robots i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _y_robots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y_robots (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y_robots i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool[] _for_humans
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _for_humans (make-list n))
     (dotimes (i n)
     (setf (elt _for_humans i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool[] _for_robots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _for_robots (make-list n))
     (dotimes (i n)
     (setf (elt _for_robots i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; bool _use_file
     (setq _use_file (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _file_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get gazebo_sfm_plugin::LoadTasks :md5sum-) "deda9a7b2b857b0ae878e4665876836b")
(setf (get gazebo_sfm_plugin::LoadTasks :datatype-) "gazebo_sfm_plugin/LoadTasks")
(setf (get gazebo_sfm_plugin::LoadTasks :request) gazebo_sfm_plugin::LoadTasksRequest)
(setf (get gazebo_sfm_plugin::LoadTasks :response) gazebo_sfm_plugin::LoadTasksResponse)

(defmethod gazebo_sfm_plugin::LoadTasksRequest
  (:response () (instance gazebo_sfm_plugin::LoadTasksResponse :init)))

(setf (get gazebo_sfm_plugin::LoadTasksRequest :md5sum-) "deda9a7b2b857b0ae878e4665876836b")
(setf (get gazebo_sfm_plugin::LoadTasksRequest :datatype-) "gazebo_sfm_plugin/LoadTasksRequest")
(setf (get gazebo_sfm_plugin::LoadTasksRequest :definition-)
      "string[] task_names
float64[] x_humans
float64[] y_humans
float64[] x_robots
float64[] y_robots
bool[] for_humans
bool[] for_robots
bool use_file
string file_path
---
bool success
string message
")

(setf (get gazebo_sfm_plugin::LoadTasksResponse :md5sum-) "deda9a7b2b857b0ae878e4665876836b")
(setf (get gazebo_sfm_plugin::LoadTasksResponse :datatype-) "gazebo_sfm_plugin/LoadTasksResponse")
(setf (get gazebo_sfm_plugin::LoadTasksResponse :definition-)
      "string[] task_names
float64[] x_humans
float64[] y_humans
float64[] x_robots
float64[] y_robots
bool[] for_humans
bool[] for_robots
bool use_file
string file_path
---
bool success
string message
")



(provide :gazebo_sfm_plugin/LoadTasks "deda9a7b2b857b0ae878e4665876836b")


