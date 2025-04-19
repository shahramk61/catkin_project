#!/usr/bin/env python3

import rospy


from std_msgs.msg import Float64


def callback(data):
    radius = data.data
    squared_radius = radius * radius
    pub.publish(squared_radius)

rospy.init_node("radius_square")

pub = rospy.Publisher("/radius_squared", Float64, queue_size=10)

rospy.Subscriber("/radius", Float64, callback)
rospy.spin()


