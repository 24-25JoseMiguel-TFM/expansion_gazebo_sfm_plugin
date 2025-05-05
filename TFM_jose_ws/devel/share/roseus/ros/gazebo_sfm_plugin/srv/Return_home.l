;; Auto-generated. Do not edit!


(when (boundp 'gazebo_sfm_plugin::Return_home)
  (if (not (find-package "GAZEBO_SFM_PLUGIN"))
    (make-package "GAZEBO_SFM_PLUGIN"))
  (shadow 'Return_home (find-package "GAZEBO_SFM_PLUGIN")))
(unless (find-package "GAZEBO_SFM_PLUGIN::RETURN_HOME")
  (make-package "GAZEBO_SFM_PLUGIN::RETURN_HOME"))
(unless (find-package "GAZEBO_SFM_PLUGIN::RETURN_HOMEREQUEST")
  (make-package "GAZEBO_SFM_PLUGIN::RETURN_HOMEREQUEST"))
(unless (find-package "GAZEBO_SFM_PLUGIN::RETURN_HOMERESPONSE")
  (make-package "GAZEBO_SFM_PLUGIN::RETURN_HOMERESPONSE"))

(in-package "ROS")





(defclass gazebo_sfm_plugin::Return_homeRequest
  :super ros::object
  :slots ())

(defmethod gazebo_sfm_plugin::Return_homeRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass gazebo_sfm_plugin::Return_homeResponse
  :super ros::object
  :slots (_success ))

(defmethod gazebo_sfm_plugin::Return_homeResponse
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

(defclass gazebo_sfm_plugin::Return_home
  :super ros::object
  :slots ())

(setf (get gazebo_sfm_plugin::Return_home :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get gazebo_sfm_plugin::Return_home :datatype-) "gazebo_sfm_plugin/Return_home")
(setf (get gazebo_sfm_plugin::Return_home :request) gazebo_sfm_plugin::Return_homeRequest)
(setf (get gazebo_sfm_plugin::Return_home :response) gazebo_sfm_plugin::Return_homeResponse)

(defmethod gazebo_sfm_plugin::Return_homeRequest
  (:response () (instance gazebo_sfm_plugin::Return_homeResponse :init)))

(setf (get gazebo_sfm_plugin::Return_homeRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get gazebo_sfm_plugin::Return_homeRequest :datatype-) "gazebo_sfm_plugin/Return_homeRequest")
(setf (get gazebo_sfm_plugin::Return_homeRequest :definition-)
      "---
bool success
")

(setf (get gazebo_sfm_plugin::Return_homeResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get gazebo_sfm_plugin::Return_homeResponse :datatype-) "gazebo_sfm_plugin/Return_homeResponse")
(setf (get gazebo_sfm_plugin::Return_homeResponse :definition-)
      "---
bool success
")



(provide :gazebo_sfm_plugin/Return_home "358e233cde0c8a8bcfea4ce193f8fc15")


