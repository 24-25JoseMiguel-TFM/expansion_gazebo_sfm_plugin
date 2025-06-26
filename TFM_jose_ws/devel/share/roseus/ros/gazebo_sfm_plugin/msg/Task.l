;; Auto-generated. Do not edit!


(when (boundp 'gazebo_sfm_plugin::Task)
  (if (not (find-package "GAZEBO_SFM_PLUGIN"))
    (make-package "GAZEBO_SFM_PLUGIN"))
  (shadow 'Task (find-package "GAZEBO_SFM_PLUGIN")))
(unless (find-package "GAZEBO_SFM_PLUGIN::TASK")
  (make-package "GAZEBO_SFM_PLUGIN::TASK"))

(in-package "ROS")
;;//! \htmlinclude Task.msg.html


(defclass gazebo_sfm_plugin::Task
  :super ros::object
  :slots (_name _x _y _for_humans _for_robots ))

(defmethod gazebo_sfm_plugin::Task
  (:init
   (&key
    ((:name __name) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:for_humans __for_humans) nil)
    ((:for_robots __for_robots) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _for_humans __for_humans)
   (setq _for_robots __for_robots)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:for_humans
   (&optional (__for_humans :null))
   (if (not (eq __for_humans :null)) (setq _for_humans __for_humans)) _for_humans)
  (:for_robots
   (&optional (__for_robots :null))
   (if (not (eq __for_robots :null)) (setq _for_robots __for_robots)) _for_robots)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; bool _for_humans
    1
    ;; bool _for_robots
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _for_humans
       (if _for_humans (write-byte -1 s) (write-byte 0 s))
     ;; bool _for_robots
       (if _for_robots (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _for_humans
     (setq _for_humans (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _for_robots
     (setq _for_robots (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get gazebo_sfm_plugin::Task :md5sum-) "de59c720fc23a7eda058f059c469339b")
(setf (get gazebo_sfm_plugin::Task :datatype-) "gazebo_sfm_plugin/Task")
(setf (get gazebo_sfm_plugin::Task :definition-)
      "string name
float64 x
float64 y
bool for_humans
bool for_robots
")



(provide :gazebo_sfm_plugin/Task "de59c720fc23a7eda058f059c469339b")


