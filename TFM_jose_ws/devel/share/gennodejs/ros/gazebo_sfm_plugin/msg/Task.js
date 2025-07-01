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
      this.x_humans = null;
      this.y_humans = null;
      this.x_robots = null;
      this.y_robots = null;
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
      if (initObj.hasOwnProperty('x_humans')) {
        this.x_humans = initObj.x_humans
      }
      else {
        this.x_humans = 0.0;
      }
      if (initObj.hasOwnProperty('y_humans')) {
        this.y_humans = initObj.y_humans
      }
      else {
        this.y_humans = 0.0;
      }
      if (initObj.hasOwnProperty('x_robots')) {
        this.x_robots = initObj.x_robots
      }
      else {
        this.x_robots = 0.0;
      }
      if (initObj.hasOwnProperty('y_robots')) {
        this.y_robots = initObj.y_robots
      }
      else {
        this.y_robots = 0.0;
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
    // Serialize message field [x_humans]
    bufferOffset = _serializer.float64(obj.x_humans, buffer, bufferOffset);
    // Serialize message field [y_humans]
    bufferOffset = _serializer.float64(obj.y_humans, buffer, bufferOffset);
    // Serialize message field [x_robots]
    bufferOffset = _serializer.float64(obj.x_robots, buffer, bufferOffset);
    // Serialize message field [y_robots]
    bufferOffset = _serializer.float64(obj.y_robots, buffer, bufferOffset);
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
    // Deserialize message field [x_humans]
    data.x_humans = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_humans]
    data.y_humans = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x_robots]
    data.x_robots = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_robots]
    data.y_robots = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [for_humans]
    data.for_humans = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [for_robots]
    data.for_robots = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 38;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gazebo_sfm_plugin/Task';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f3b3fd965b6c18a7c7b49995790c231c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    float64 x_humans
    float64 y_humans
    float64 x_robots
    float64 y_robots
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

    if (msg.x_humans !== undefined) {
      resolved.x_humans = msg.x_humans;
    }
    else {
      resolved.x_humans = 0.0
    }

    if (msg.y_humans !== undefined) {
      resolved.y_humans = msg.y_humans;
    }
    else {
      resolved.y_humans = 0.0
    }

    if (msg.x_robots !== undefined) {
      resolved.x_robots = msg.x_robots;
    }
    else {
      resolved.x_robots = 0.0
    }

    if (msg.y_robots !== undefined) {
      resolved.y_robots = msg.y_robots;
    }
    else {
      resolved.y_robots = 0.0
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
