; Auto-generated. Do not edit!


(cl:in-package gazebo_sfm_plugin-srv)


;//! \htmlinclude Update_waypoint-request.msg.html

(cl:defclass <Update_waypoint-request> (roslisp-msg-protocol:ros-message)
  ((waypoints
    :reader waypoints
    :initarg :waypoints
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (task_name
    :reader task_name
    :initarg :task_name
    :type cl:string
    :initform ""))
)

(cl:defclass Update_waypoint-request (<Update_waypoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Update_waypoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Update_waypoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<Update_waypoint-request> is deprecated: use gazebo_sfm_plugin-srv:Update_waypoint-request instead.")))

(cl:ensure-generic-function 'waypoints-val :lambda-list '(m))
(cl:defmethod waypoints-val ((m <Update_waypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:waypoints-val is deprecated.  Use gazebo_sfm_plugin-srv:waypoints instead.")
  (waypoints m))

(cl:ensure-generic-function 'task_name-val :lambda-list '(m))
(cl:defmethod task_name-val ((m <Update_waypoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:task_name-val is deprecated.  Use gazebo_sfm_plugin-srv:task_name instead.")
  (task_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Update_waypoint-request>) ostream)
  "Serializes a message object of type '<Update_waypoint-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypoints))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'task_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'task_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Update_waypoint-request>) istream)
  "Deserializes a message object of type '<Update_waypoint-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'task_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Update_waypoint-request>)))
  "Returns string type for a service object of type '<Update_waypoint-request>"
  "gazebo_sfm_plugin/Update_waypointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Update_waypoint-request)))
  "Returns string type for a service object of type 'Update_waypoint-request"
  "gazebo_sfm_plugin/Update_waypointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Update_waypoint-request>)))
  "Returns md5sum for a message object of type '<Update_waypoint-request>"
  "f5dd19960de228b666941d1879a83836")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Update_waypoint-request)))
  "Returns md5sum for a message object of type 'Update_waypoint-request"
  "f5dd19960de228b666941d1879a83836")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Update_waypoint-request>)))
  "Returns full string definition for message of type '<Update_waypoint-request>"
  (cl:format cl:nil "geometry_msgs/Point[] waypoints~%string task_name~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Update_waypoint-request)))
  "Returns full string definition for message of type 'Update_waypoint-request"
  (cl:format cl:nil "geometry_msgs/Point[] waypoints~%string task_name~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Update_waypoint-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'task_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Update_waypoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Update_waypoint-request
    (cl:cons ':waypoints (waypoints msg))
    (cl:cons ':task_name (task_name msg))
))
;//! \htmlinclude Update_waypoint-response.msg.html

(cl:defclass <Update_waypoint-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Update_waypoint-response (<Update_waypoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Update_waypoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Update_waypoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<Update_waypoint-response> is deprecated: use gazebo_sfm_plugin-srv:Update_waypoint-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Update_waypoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:success-val is deprecated.  Use gazebo_sfm_plugin-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Update_waypoint-response>) ostream)
  "Serializes a message object of type '<Update_waypoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Update_waypoint-response>) istream)
  "Deserializes a message object of type '<Update_waypoint-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Update_waypoint-response>)))
  "Returns string type for a service object of type '<Update_waypoint-response>"
  "gazebo_sfm_plugin/Update_waypointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Update_waypoint-response)))
  "Returns string type for a service object of type 'Update_waypoint-response"
  "gazebo_sfm_plugin/Update_waypointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Update_waypoint-response>)))
  "Returns md5sum for a message object of type '<Update_waypoint-response>"
  "f5dd19960de228b666941d1879a83836")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Update_waypoint-response)))
  "Returns md5sum for a message object of type 'Update_waypoint-response"
  "f5dd19960de228b666941d1879a83836")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Update_waypoint-response>)))
  "Returns full string definition for message of type '<Update_waypoint-response>"
  (cl:format cl:nil "bool success  # Respuesta: true si la trayectoria se actualizo correctamente~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Update_waypoint-response)))
  "Returns full string definition for message of type 'Update_waypoint-response"
  (cl:format cl:nil "bool success  # Respuesta: true si la trayectoria se actualizo correctamente~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Update_waypoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Update_waypoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Update_waypoint-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Update_waypoint)))
  'Update_waypoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Update_waypoint)))
  'Update_waypoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Update_waypoint)))
  "Returns string type for a service object of type '<Update_waypoint>"
  "gazebo_sfm_plugin/Update_waypoint")