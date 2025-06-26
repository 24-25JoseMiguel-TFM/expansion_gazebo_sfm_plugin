; Auto-generated. Do not edit!


(cl:in-package gazebo_sfm_plugin-msg)


;//! \htmlinclude Task.msg.html

(cl:defclass <Task> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (for_humans
    :reader for_humans
    :initarg :for_humans
    :type cl:boolean
    :initform cl:nil)
   (for_robots
    :reader for_robots
    :initarg :for_robots
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Task (<Task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-msg:<Task> is deprecated: use gazebo_sfm_plugin-msg:Task instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:name-val is deprecated.  Use gazebo_sfm_plugin-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:x-val is deprecated.  Use gazebo_sfm_plugin-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:y-val is deprecated.  Use gazebo_sfm_plugin-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'for_humans-val :lambda-list '(m))
(cl:defmethod for_humans-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:for_humans-val is deprecated.  Use gazebo_sfm_plugin-msg:for_humans instead.")
  (for_humans m))

(cl:ensure-generic-function 'for_robots-val :lambda-list '(m))
(cl:defmethod for_robots-val ((m <Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:for_robots-val is deprecated.  Use gazebo_sfm_plugin-msg:for_robots instead.")
  (for_robots m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Task>) ostream)
  "Serializes a message object of type '<Task>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'for_humans) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'for_robots) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Task>) istream)
  "Deserializes a message object of type '<Task>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'for_humans) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'for_robots) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Task>)))
  "Returns string type for a message object of type '<Task>"
  "gazebo_sfm_plugin/Task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Task)))
  "Returns string type for a message object of type 'Task"
  "gazebo_sfm_plugin/Task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Task>)))
  "Returns md5sum for a message object of type '<Task>"
  "de59c720fc23a7eda058f059c469339b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Task)))
  "Returns md5sum for a message object of type 'Task"
  "de59c720fc23a7eda058f059c469339b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Task>)))
  "Returns full string definition for message of type '<Task>"
  (cl:format cl:nil "string name~%float64 x~%float64 y~%bool for_humans~%bool for_robots~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Task)))
  "Returns full string definition for message of type 'Task"
  (cl:format cl:nil "string name~%float64 x~%float64 y~%bool for_humans~%bool for_robots~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Task>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     8
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Task>))
  "Converts a ROS message object to a list"
  (cl:list 'Task
    (cl:cons ':name (name msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':for_humans (for_humans msg))
    (cl:cons ':for_robots (for_robots msg))
))
