#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import math

class TurtleGuide:
    def __init__(self):
        # Initialize the node
        rospy.init_node('turtle_guide_to_xy', anonymous=True)
        
        # Get parameters from rosparam
        self.target_x = rospy.get_param('~target_x', 5.0)
        self.target_y = rospy.get_param('~target_y', 5.0)
        self.threshold = rospy.get_param('~threshold', 0.5)
        
        # Publisher for velocity commands
        self.vel_pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
        
        # Subscriber for pose
        self.pose_sub = rospy.Subscriber('/turtle1/pose', Pose, self.pose_callback)
        
        # Current pose
        self.current_pose = Pose()
        
        # Velocity message
        self.vel_msg = Twist()
        
        # Log initial target
        rospy.loginfo("Moving to (%s, %s)", self.target_x, self.target_y)
        
        # Rate
        self.rate = rospy.Rate(10)  # 10Hz

    def pose_callback(self, data):
        """Callback function for pose updates"""
        self.current_pose = data
        rospy.logdebug("Current position: x=%s, y=%s", self.current_pose.x, self.current_pose.y)

    def distance_to_target(self):
        """Calculate Euclidean distance to target"""
        return math.sqrt(
            (self.target_x - self.current_pose.x) ** 2 +
            (self.target_y - self.current_pose.y) ** 2
        )

    def angle_to_target(self):
        """Calculate angle to target"""
        return math.atan2(
            self.target_y - self.current_pose.y,
            self.target_x - self.current_pose.x
        )

    def run(self):
        """Main control loop"""
        while not rospy.is_shutdown():
            # Check if target is reached
            if self.distance_to_target() < self.threshold:
                rospy.loginfo("Target Reached")
                self.vel_msg.linear.x = 0.0
                self.vel_msg.angular.z = 0.0
                self.vel_pub.publish(self.vel_msg)
                self.rate.sleep()
                continue  # Keep node alive

            # Calculate movement
            angle_to_target = self.angle_to_target()
            angle_diff = angle_to_target - self.current_pose.theta

            # Normalize angle
            while angle_diff > math.pi:
                angle_diff -= 2 * math.pi
            while angle_diff < -math.pi:
                angle_diff += 2 * math.pi

            # Set velocities
            self.vel_msg.linear.x = 1.0  # Constant forward speed
            self.vel_msg.angular.z = 4.0 * angle_diff  # Proportional angular velocity

            # Publish velocity
            self.vel_pub.publish(self.vel_msg)
            
            self.rate.sleep()

if __name__ == '__main__':
    try:
        turtle_guide = TurtleGuide()
        turtle_guide.run()
    except rospy.ROSInterruptException:
        pass