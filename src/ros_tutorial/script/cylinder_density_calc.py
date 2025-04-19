#!/usr/bin/env python

import rospy
from ros_tutorial.msg import Cylinder
from std_msgs.msg import Float64

class CylinderWeightCalculator:
    def __init__(self):
        # Initialize node
        rospy.init_node("cylinder_density_calc", anonymous=True)
        
        # Initialize state variables
        self.volume = 0.0
        self.volume_found = False
        self.density = 0.0
        self.density_found = False
        
        # Set up subscribers and publisher
        rospy.Subscriber("/cylinder", Cylinder, self.cylinder_callback)
        rospy.Subscriber("/density", Float64, self.density_callback)
        self.pub = rospy.Publisher("/weight", Float64, queue_size=10)
        
        # Log node initialization
        rospy.loginfo("CylinderWeightCalculator node initialized")
        
    def cylinder_callback(self, data):
        self.volume = data.volume
        self.volume_found = True
        rospy.loginfo(f"Received cylinder volume: {self.volume}")
        
    def density_callback(self, data):
        self.density = data.data
        self.density_found = True
        rospy.loginfo(f"Received density: {self.density}")
        
    def calculate_weight(self):
        if self.density_found and self.volume_found:
            weight = self.density * self.volume
            self.pub.publish(weight)
            rospy.loginfo(f"Calculated and published weight: {weight}")
        else:
            rospy.loginfo("Waiting for both volume and density to calculate weight")
    
    def run(self):
        rate = rospy.Rate(10)  # 10 Hz (0.1 seconds)
        rospy.loginfo("Starting main loop")
        while not rospy.is_shutdown():
            self.calculate_weight()
            rate.sleep()

if __name__ == '__main__':
    try:
        calculator = CylinderWeightCalculator()
        calculator.run()
    except rospy.ROSInterruptException:
        rospy.loginfo("Node terminated")