// Auto-generated. Do not edit!

// (in-package ros_tutorial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Cylinder {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.volume = null;
      this.surface_area = null;
    }
    else {
      if (initObj.hasOwnProperty('volume')) {
        this.volume = initObj.volume
      }
      else {
        this.volume = 0.0;
      }
      if (initObj.hasOwnProperty('surface_area')) {
        this.surface_area = initObj.surface_area
      }
      else {
        this.surface_area = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Cylinder
    // Serialize message field [volume]
    bufferOffset = _serializer.float64(obj.volume, buffer, bufferOffset);
    // Serialize message field [surface_area]
    bufferOffset = _serializer.float64(obj.surface_area, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Cylinder
    let len;
    let data = new Cylinder(null);
    // Deserialize message field [volume]
    data.volume = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [surface_area]
    data.surface_area = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_tutorial/Cylinder';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d4d85be24438773cbf4abab3bea881b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 volume
    float64 surface_area
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Cylinder(null);
    if (msg.volume !== undefined) {
      resolved.volume = msg.volume;
    }
    else {
      resolved.volume = 0.0
    }

    if (msg.surface_area !== undefined) {
      resolved.surface_area = msg.surface_area;
    }
    else {
      resolved.surface_area = 0.0
    }

    return resolved;
    }
};

module.exports = Cylinder;
