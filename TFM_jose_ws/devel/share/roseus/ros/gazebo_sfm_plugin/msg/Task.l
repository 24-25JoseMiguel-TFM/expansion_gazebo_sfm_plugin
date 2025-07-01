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
  :slots (_name _x_humans _y_humans _x_robots _y_robots _for_humans _for_robots ))

(defmethod gazebo_sfm_plugin::Task
  (:init
   (&key
    ((:name __name) "")
    ((:x_humans __x_humans) 0.0)
    ((:y_humans __y_humans) 0.0)
    ((:x_robots __x_robots) 0.0)
    ((:y_robots __y_robots) 0.0)
    ((:for_humans __for_humans) nil)
    ((:for_robots __for_robots) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _x_humans (float __x_humans))
   (setq _y_humans (float __y_humans))
   (setq _x_robots (float __x_robots))
   (setq _y_robots (float __y_robots))
   (setq _for_humans __for_humans)
   (setq _for_robots __for_robots)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
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
    ;; float64 _x_humans
    8
    ;; float64 _y_humans
    8
    ;; float64 _x_robots
    8
    ;; float64 _y_robots
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
     ;; float64 _x_humans
       (sys::poke _x_humans (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_humans
       (sys::poke _y_humans (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_robots
       (sys::poke _x_robots (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_robots
       (sys::poke _y_robots (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _x_humans
     (setq _x_humans (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_humans
     (setq _y_humans (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_robots
     (setq _x_robots (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_robots
     (setq _y_robots (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _for_humans
     (setq _for_humans (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _for_robots
     (setq _for_robots (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get gazebo_sfm_plugin::Task :md5sum-) "f3b3fd965b6c18a7c7b49995790c231c")
(setf (get gazebo_sfm_plugin::Task :datatype-) "gazebo_sfm_plugin/Task")
(setf (get gazebo_sfm_plugin::Task :definition-)
      "string name
float64 x_humans
float64 y_humans
float64 x_robots
float64 y_robots
bool for_humans
bool for_robots
")



(provide :gazebo_sfm_plugin/Task "f3b3fd965b6c18a7c7b49995790c231c")


