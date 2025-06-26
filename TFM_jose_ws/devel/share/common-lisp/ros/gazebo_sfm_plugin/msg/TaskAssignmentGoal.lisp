; Auto-generated. Do not edit!


(cl:in-package gazebo_sfm_plugin-msg)


;//! \htmlinclude TaskAssignmentGoal.msg.html

(cl:defclass <TaskAssignmentGoal> (roslisp-msg-protocol:ros-message)
  ((task_names
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

(cl:defclass TaskAssignmentGoal (<TaskAssignmentGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TaskAssignmentGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TaskAssignmentGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-msg:<TaskAssignmentGoal> is deprecated: use gazebo_sfm_plugin-msg:TaskAssignmentGoal instead.")))

(cl:ensure-generic-function 'task_names-val :lambda-list '(m))
(cl:defmethod task_names-val ((m <TaskAssignmentGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:task_names-val is deprecated.  Use gazebo_sfm_plugin-msg:task_names instead.")
  (task_names m))

(cl:ensure-generic-function 'positions-val :lambda-list '(m))
(cl:defmethod positions-val ((m <TaskAssignmentGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:positions-val is deprecated.  Use gazebo_sfm_plugin-msg:positions instead.")
  (positions m))

(cl:ensure-generic-function 'target_types-val :lambda-list '(m))
(cl:defmethod target_types-val ((m <TaskAssignmentGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-msg:target_types-val is deprecated.  Use gazebo_sfm_plugin-msg:target_types instead.")
  (target_types m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TaskAssignmentGoal>) ostream)
  "Serializes a message object of type '<TaskAssignmentGoal>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TaskAssignmentGoal>) istream)
  "Deserializes a message object of type '<TaskAssignmentGoal>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TaskAssignmentGoal>)))
  "Returns string type for a message object of type '<TaskAssignmentGoal>"
  "gazebo_sfm_plugin/TaskAssignmentGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TaskAssignmentGoal)))
  "Returns string type for a message object of type 'TaskAssignmentGoal"
  "gazebo_sfm_plugin/TaskAssignmentGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TaskAssignmentGoal>)))
  "Returns md5sum for a message object of type '<TaskAssignmentGoal>"
  "9bcdd9e4ed3cb46133c77abe8391c30a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TaskAssignmentGoal)))
  "Returns md5sum for a message object of type 'TaskAssignmentGoal"
  "9bcdd9e4ed3cb46133c77abe8391c30a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TaskAssignmentGoal>)))
  "Returns full string definition for message of type '<TaskAssignmentGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal definition~%string[] task_names~%geometry_msgs/Point[] positions~%string[] target_types~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TaskAssignmentGoal)))
  "Returns full string definition for message of type 'TaskAssignmentGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal definition~%string[] task_names~%geometry_msgs/Point[] positions~%string[] target_types~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TaskAssignmentGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'task_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'target_types) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TaskAssignmentGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TaskAssignmentGoal
    (cl:cons ':task_names (task_names msg))
    (cl:cons ':positions (positions msg))
    (cl:cons ':target_types (target_types msg))
))
