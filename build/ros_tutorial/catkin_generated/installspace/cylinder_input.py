#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64

class CylinderInput:
    def __init__(self):
        # Initialize node
        rospy.init_node("cylinder_input", anonymous=True)
        
        # Set up publishers
        self.radius_pub = rospy.Publisher("/radius", Float64, queue_size=10)
        self.height_pub = rospy.Publisher("/height", Float64, queue_size=10)
        self.density_pub = rospy.Publisher("/density", Float64, queue_size=10)
        
        # Initialize variables
        self.radius = 0.0
        self.height = 0.0
        self.density = 0.0
        
        # Log node initialization
        rospy.loginfo("CylinderInput node initialized")
        
    def get_user_input(self):
        # Get and validate user input
        while not rospy.is_shutdown():
            try:
                self.radius = float(input("Enter radius: "))
                if self.radius <= 0:
                    rospy.logwarn("Radius must be positive")
                    continue
                break
            except ValueError:
                rospy.logwarn("Invalid input for radius. Please enter a number.")
        
        while not rospy.is_shutdown():
            try:
                self.height = float(input("Enter height: "))
                if self.height <= 0:
                    rospy.logwarn("Height must be positive")
                    continue
                break
            except ValueError:
                rospy.logwarn("Invalid input for height. Please enter a number.")
        
        while not rospy.is_shutdown():
            try:
                self.density = float(input("Enter density: "))
                if self.density <= 0:
                    rospy.logwarn("Density must be positive")
                    continue
                break
            except ValueError:
                rospy.logwarn("Invalid input for density. Please enter a number.")
        
        rospy.loginfo(f"Received inputs: radius={self.radius}, height={self.height}, density={self.density}")
    
    def publish_inputs(self):
        # Publish the inputs to their respective topics
        self.radius_pub.publish(self.radius)
        self.height_pub.publish(self.height)
        self.density_pub.publish(self.density)
        rospy.loginfo(f"Published: radius={self.radius}, height={self.height}, density={self.density}")
    
    def run(self):
        # Get user input once
        self.get_user_input()
        
        # Run main loop
        rate = rospy.Rate(10)  # 10 Hz (0.1 seconds)
        rospy.loginfo("Starting publishing loop")
        while not rospy.is_shutdown():
            self.publish_inputs()
            rate.sleep()

if __name__ == '__main__':
    try:
        node = CylinderInput()
        node.run()
    except rospy.ROSInterruptException:
        rospy.loginfo("Node terminated")