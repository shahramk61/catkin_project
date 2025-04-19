;; Auto-generated. Do not edit!


(when (boundp 'ros_tutorial::Cylinder)
  (if (not (find-package "ROS_TUTORIAL"))
    (make-package "ROS_TUTORIAL"))
  (shadow 'Cylinder (find-package "ROS_TUTORIAL")))
(unless (find-package "ROS_TUTORIAL::CYLINDER")
  (make-package "ROS_TUTORIAL::CYLINDER"))

(in-package "ROS")
;;//! \htmlinclude Cylinder.msg.html


(defclass ros_tutorial::Cylinder
  :super ros::object
  :slots (_volume _surface_area ))

(defmethod ros_tutorial::Cylinder
  (:init
   (&key
    ((:volume __volume) 0.0)
    ((:surface_area __surface_area) 0.0)
    )
   (send-super :init)
   (setq _volume (float __volume))
   (setq _surface_area (float __surface_area))
   self)
  (:volume
   (&optional __volume)
   (if __volume (setq _volume __volume)) _volume)
  (:surface_area
   (&optional __surface_area)
   (if __surface_area (setq _surface_area __surface_area)) _surface_area)
  (:serialization-length
   ()
   (+
    ;; float64 _volume
    8
    ;; float64 _surface_area
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _volume
       (sys::poke _volume (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _surface_area
       (sys::poke _surface_area (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _volume
     (setq _volume (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _surface_area
     (setq _surface_area (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ros_tutorial::Cylinder :md5sum-) "5d4d85be24438773cbf4abab3bea881b")
(setf (get ros_tutorial::Cylinder :datatype-) "ros_tutorial/Cylinder")
(setf (get ros_tutorial::Cylinder :definition-)
      "float64 volume
float64 surface_area
")



(provide :ros_tutorial/Cylinder "5d4d85be24438773cbf4abab3bea881b")


