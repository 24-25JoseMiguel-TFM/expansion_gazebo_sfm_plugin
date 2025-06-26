; Auto-generated. Do not edit!


(cl:in-package gazebo_sfm_plugin-srv)


;//! \htmlinclude LoadTasks-request.msg.html

(cl:defclass <LoadTasks-request> (roslisp-msg-protocol:ros-message)
  ((use_file
    :reader use_file
    :initarg :use_file
    :type cl:boolean
    :initform cl:nil)
   (file_path
    :reader file_path
    :initarg :file_path
    :type cl:string
    :initform "")
   (task_names
    :reader task_names
    :initarg :task_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (positions
    :reader positions
    :initarg :positions
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (target_types
    :reader target_types
    :initarg :target_types
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass LoadTasks-request (<LoadTasks-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadTasks-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadTasks-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<LoadTasks-request> is deprecated: use gazebo_sfm_plugin-srv:LoadTasks-request instead.")))

(cl:ensure-generic-function 'use_file-val :lambda-list '(m))
(cl:defmethod use_file-val ((m <LoadTasks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:use_file-val is deprecated.  Use gazebo_sfm_plugin-srv:use_file instead.")
  (use_file m))

(cl:ensure-generic-function 'file_path-val :lambda-list '(m))
(cl:defmethod file_path-val ((m <LoadTasks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:file_path-val is deprecated.  Use gazebo_sfm_plugin-srv:file_path instead.")
  (file_path m))

(cl:ensure-generic-function 'task_names-val :lambda-list '(m))
(cl:defmethod task_names-val ((m <LoadTasks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:task_names-val is deprecated.  Use gazebo_sfm_plugin-srv:task_names instead.")
  (task_names m))

(cl:ensure-generic-function 'positions-val :lambda-list '(m))
(cl:defmethod positions-val ((m <LoadTasks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:positions-val is deprecated.  Use gazebo_sfm_plugin-srv:positions instead.")
  (positions m))

(cl:ensure-generic-function 'target_types-val :lambda-list '(m))
(cl:defmethod target_types-val ((m <LoadTasks-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:target_types-val is deprecated.  Use gazebo_sfm_plugin-srv:target_types instead.")
  (target_types m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadTasks-request>) ostream)
  "Serializes a message object of type '<LoadTasks-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_file) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'file_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'file_path))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'task_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'task_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'positions))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'target_types))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'target_types))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadTasks-request>) istream)
  "Deserializes a message object of type '<LoadTasks-request>"
    (cl:setf (cl:slot-value msg 'use_file) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'file_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'file_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'task_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'task_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'target_types) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'target_types)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadTasks-request>)))
  "Returns string type for a service object of type '<LoadTasks-request>"
  "gazebo_sfm_plugin/LoadTasksRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadTasks-request)))
  "Returns string type for a service object of type 'LoadTasks-request"
  "gazebo_sfm_plugin/LoadTasksRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadTasks-request>)))
  "Returns md5sum for a message object of type '<LoadTasks-request>"
  "3b67f7d0c861348ae151a1487a64fe7e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadTasks-request)))
  "Returns md5sum for a message object of type 'LoadTasks-request"
  "3b67f7d0c861348ae151a1487a64fe7e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadTasks-request>)))
  "Returns full string definition for message of type '<LoadTasks-request>"
  (cl:format cl:nil "bool use_file~%string file_path~%string[] task_names~%geometry_msgs/Point[] positions~%string[] target_types~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadTasks-request)))
  "Returns full string definition for message of type 'LoadTasks-request"
  (cl:format cl:nil "bool use_file~%string file_path~%string[] task_names~%geometry_msgs/Point[] positions~%string[] target_types~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadTasks-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'file_path))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'task_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'target_types) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadTasks-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadTasks-request
    (cl:cons ':use_file (use_file msg))
    (cl:cons ':file_path (file_path msg))
    (cl:cons ':task_names (task_names msg))
    (cl:cons ':positions (positions msg))
    (cl:cons ':target_types (target_types msg))
))
;//! \htmlinclude LoadTasks-response.msg.html

(cl:defclass <LoadTasks-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass LoadTasks-response (<LoadTasks-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadTasks-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadTasks-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<LoadTasks-response> is deprecated: use gazebo_sfm_plugin-srv:LoadTasks-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LoadTasks-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:success-val is deprecated.  Use gazebo_sfm_plugin-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <LoadTasks-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:message-val is deprecated.  Use gazebo_sfm_plugin-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadTasks-response>) ostream)
  "Serializes a message object of type '<LoadTasks-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadTasks-response>) istream)
  "Deserializes a message object of type '<LoadTasks-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadTasks-response>)))
  "Returns string type for a service object of type '<LoadTasks-response>"
  "gazebo_sfm_plugin/LoadTasksResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadTasks-response)))
  "Returns string type for a service object of type 'LoadTasks-response"
  "gazebo_sfm_plugin/LoadTasksResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadTasks-response>)))
  "Returns md5sum for a message object of type '<LoadTasks-response>"
  "3b67f7d0c861348ae151a1487a64fe7e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadTasks-response)))
  "Returns md5sum for a message object of type 'LoadTasks-response"
  "3b67f7d0c861348ae151a1487a64fe7e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadTasks-response>)))
  "Returns full string definition for message of type '<LoadTasks-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadTasks-response)))
  "Returns full string definition for message of type 'LoadTasks-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadTasks-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadTasks-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadTasks-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadTasks)))
  'LoadTasks-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadTasks)))
  'LoadTasks-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadTasks)))
  "Returns string type for a service object of type '<LoadTasks>"
  "gazebo_sfm_plugin/LoadTasks")