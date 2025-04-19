; Auto-generated. Do not edit!


(cl:in-package ros_tutorial-msg)


;//! \htmlinclude Cylinder.msg.html

(cl:defclass <Cylinder> (roslisp-msg-protocol:ros-message)
  ((volume
    :reader volume
    :initarg :volume
    :type cl:float
    :initform 0.0)
   (surface_area
    :reader surface_area
    :initarg :surface_area
    :type cl:float
    :initform 0.0))
)

(cl:defclass Cylinder (<Cylinder>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cylinder>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cylinder)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_tutorial-msg:<Cylinder> is deprecated: use ros_tutorial-msg:Cylinder instead.")))

(cl:ensure-generic-function 'volume-val :lambda-list '(m))
(cl:defmethod volume-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_tutorial-msg:volume-val is deprecated.  Use ros_tutorial-msg:volume instead.")
  (volume m))

(cl:ensure-generic-function 'surface_area-val :lambda-list '(m))
(cl:defmethod surface_area-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_tutorial-msg:surface_area-val is deprecated.  Use ros_tutorial-msg:surface_area instead.")
  (surface_area m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cylinder>) ostream)
  "Serializes a message object of type '<Cylinder>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'volume))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'surface_area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cylinder>) istream)
  "Deserializes a message object of type '<Cylinder>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volume) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'surface_area) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cylinder>)))
  "Returns string type for a message object of type '<Cylinder>"
  "ros_tutorial/Cylinder")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cylinder)))
  "Returns string type for a message object of type 'Cylinder"
  "ros_tutorial/Cylinder")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cylinder>)))
  "Returns md5sum for a message object of type '<Cylinder>"
  "5d4d85be24438773cbf4abab3bea881b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cylinder)))
  "Returns md5sum for a message object of type 'Cylinder"
  "5d4d85be24438773cbf4abab3bea881b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cylinder>)))
  "Returns full string definition for message of type '<Cylinder>"
  (cl:format cl:nil "float64 volume~%float64 surface_area~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cylinder)))
  "Returns full string definition for message of type 'Cylinder"
  (cl:format cl:nil "float64 volume~%float64 surface_area~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cylinder>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cylinder>))
  "Converts a ROS message object to a list"
  (cl:list 'Cylinder
    (cl:cons ':volume (volume msg))
    (cl:cons ':surface_area (surface_area msg))
))
