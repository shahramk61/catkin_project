#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
import time


class turtle_control:
    def __init__(self):
        rospy.init_node("turtle_control", anonymous=True)
        self.pub = rospy.Publisher("/turtle1/cmd_vel", Twist, queue_size=10)
        self.rate = rospy.Rate(10)  # 10 Hz

    def move_forward(self, speed, duration):
        msg = Twist()
        msg.linear.x = speed
        self.pub.publish(msg)
        time.sleep(duration)
        msg.linear.x = 0
        self.pub.publish(msg)

    def turn(self, angular_speed, duration):
        msg = Twist()
        msg.angular.z = angular_speed
        self.pub.publish(msg)
        time.sleep(duration)
        msg.angular.z = 0
        self.pub.publish(msg)

    def run(self):
        while not rospy.is_shutdown():
            for _ in range(4):  # Repeat 4 times for a square
                self.move_forward(0.5, 2.0)  # Move forward at speed 0.5 for 2 seconds
                self.turn(1.57, 1.0)  # Turn 90 degrees (approx. pi/2 radians) for 1 second
            self.rate.sleep()


if __name__ == "__main__":
    try:
        controller = turtle_control()
        controller.run()
    except rospy.ROSInterruptException:
        pass