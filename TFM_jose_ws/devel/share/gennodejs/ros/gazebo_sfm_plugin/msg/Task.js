// Auto-generated. Do not edit!

// (in-package gazebo_sfm_plugin.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Task {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.x = null;
      this.y = null;
      this.for_humans = null;
      this.for_robots = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('for_humans')) {
        this.for_humans = initObj.for_humans
      }
      else {
        this.for_humans = false;
      }
      if (initObj.hasOwnProperty('for_robots')) {
        this.for_robots = initObj.for_robots
      }
      else {
        this.for_robots = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Task
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [for_humans]
    bufferOffset = _serializer.bool(obj.for_humans, buffer, bufferOffset);
    // Serialize message field [for_robots]
    bufferOffset = _serializer.bool(obj.for_robots, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Task
    let len;
    let data = new Task(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [for_humans]
    data.for_humans = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [for_robots]
    data.for_robots = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gazebo_sfm_plugin/Task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de59c720fc23a7eda058f059c469339b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    float64 x
    float64 y
    bool for_humans
    bool for_robots
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Task(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.for_humans !== undefined) {
      resolved.for_humans = msg.for_humans;
    }
    else {
      resolved.for_humans = false
    }

    if (msg.for_robots !== undefined) {
      resolved.for_robots = msg.for_robots;
    }
    else {
      resolved.for_robots = false
    }

    return resolved;
    }
};

module.exports = Task;
