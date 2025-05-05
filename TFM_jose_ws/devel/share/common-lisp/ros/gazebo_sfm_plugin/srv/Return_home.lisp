; Auto-generated. Do not edit!


(cl:in-package gazebo_sfm_plugin-srv)


;//! \htmlinclude Return_home-request.msg.html

(cl:defclass <Return_home-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Return_home-request (<Return_home-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Return_home-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Return_home-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<Return_home-request> is deprecated: use gazebo_sfm_plugin-srv:Return_home-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Return_home-request>) ostream)
  "Serializes a message object of type '<Return_home-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Return_home-request>) istream)
  "Deserializes a message object of type '<Return_home-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Return_home-request>)))
  "Returns string type for a service object of type '<Return_home-request>"
  "gazebo_sfm_plugin/Return_homeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Return_home-request)))
  "Returns string type for a service object of type 'Return_home-request"
  "gazebo_sfm_plugin/Return_homeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Return_home-request>)))
  "Returns md5sum for a message object of type '<Return_home-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Return_home-request)))
  "Returns md5sum for a message object of type 'Return_home-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Return_home-request>)))
  "Returns full string definition for message of type '<Return_home-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Return_home-request)))
  "Returns full string definition for message of type 'Return_home-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Return_home-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Return_home-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Return_home-request
))
;//! \htmlinclude Return_home-response.msg.html

(cl:defclass <Return_home-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Return_home-response (<Return_home-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Return_home-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Return_home-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gazebo_sfm_plugin-srv:<Return_home-response> is deprecated: use gazebo_sfm_plugin-srv:Return_home-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Return_home-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gazebo_sfm_plugin-srv:success-val is deprecated.  Use gazebo_sfm_plugin-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Return_home-response>) ostream)
  "Serializes a message object of type '<Return_home-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Return_home-response>) istream)
  "Deserializes a message object of type '<Return_home-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Return_home-response>)))
  "Returns string type for a service object of type '<Return_home-response>"
  "gazebo_sfm_plugin/Return_homeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Return_home-response)))
  "Returns string type for a service object of type 'Return_home-response"
  "gazebo_sfm_plugin/Return_homeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Return_home-response>)))
  "Returns md5sum for a message object of type '<Return_home-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Return_home-response)))
  "Returns md5sum for a message object of type 'Return_home-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Return_home-response>)))
  "Returns full string definition for message of type '<Return_home-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Return_home-response)))
  "Returns full string definition for message of type 'Return_home-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Return_home-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Return_home-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Return_home-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Return_home)))
  'Return_home-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Return_home)))
  'Return_home-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Return_home)))
  "Returns string type for a service object of type '<Return_home>"
  "gazebo_sfm_plugin/Return_home")