// Auto-generated. Do not edit!

// (in-package gazebo_sfm_plugin.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class LoadTasksRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.task_names = null;
      this.x_humans = null;
      this.y_humans = null;
      this.x_robots = null;
      this.y_robots = null;
      this.for_humans = null;
      this.for_robots = null;
      this.use_file = null;
      this.file_path = null;
    }
    else {
      if (initObj.hasOwnProperty('task_names')) {
        this.task_names = initObj.task_names
      }
      else {
        this.task_names = [];
      }
      if (initObj.hasOwnProperty('x_humans')) {
        this.x_humans = initObj.x_humans
      }
      else {
        this.x_humans = [];
      }
      if (initObj.hasOwnProperty('y_humans')) {
        this.y_humans = initObj.y_humans
      }
      else {
        this.y_humans = [];
      }
      if (initObj.hasOwnProperty('x_robots')) {
        this.x_robots = initObj.x_robots
      }
      else {
        this.x_robots = [];
      }
      if (initObj.hasOwnProperty('y_robots')) {
        this.y_robots = initObj.y_robots
      }
      else {
        this.y_robots = [];
      }
      if (initObj.hasOwnProperty('for_humans')) {
        this.for_humans = initObj.for_humans
      }
      else {
        this.for_humans = [];
      }
      if (initObj.hasOwnProperty('for_robots')) {
        this.for_robots = initObj.for_robots
      }
      else {
        this.for_robots = [];
      }
      if (initObj.hasOwnProperty('use_file')) {
        this.use_file = initObj.use_file
      }
      else {
        this.use_file = false;
      }
      if (initObj.hasOwnProperty('file_path')) {
        this.file_path = initObj.file_path
      }
      else {
        this.file_path = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadTasksRequest
    // Serialize message field [task_names]
    bufferOffset = _arraySerializer.string(obj.task_names, buffer, bufferOffset, null);
    // Serialize message field [x_humans]
    bufferOffset = _arraySerializer.float64(obj.x_humans, buffer, bufferOffset, null);
    // Serialize message field [y_humans]
    bufferOffset = _arraySerializer.float64(obj.y_humans, buffer, bufferOffset, null);
    // Serialize message field [x_robots]
    bufferOffset = _arraySerializer.float64(obj.x_robots, buffer, bufferOffset, null);
    // Serialize message field [y_robots]
    bufferOffset = _arraySerializer.float64(obj.y_robots, buffer, bufferOffset, null);
    // Serialize message field [for_humans]
    bufferOffset = _arraySerializer.bool(obj.for_humans, buffer, bufferOffset, null);
    // Serialize message field [for_robots]
    bufferOffset = _arraySerializer.bool(obj.for_robots, buffer, bufferOffset, null);
    // Serialize message field [use_file]
    bufferOffset = _serializer.bool(obj.use_file, buffer, bufferOffset);
    // Serialize message field [file_path]
    bufferOffset = _serializer.string(obj.file_path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadTasksRequest
    let len;
    let data = new LoadTasksRequest(null);
    // Deserialize message field [task_names]
    data.task_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [x_humans]
    data.x_humans = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [y_humans]
    data.y_humans = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [x_robots]
    data.x_robots = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [y_robots]
    data.y_robots = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [for_humans]
    data.for_humans = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [for_robots]
    data.for_robots = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [use_file]
    data.use_file = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [file_path]
    data.file_path = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.task_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 8 * object.x_humans.length;
    length += 8 * object.y_humans.length;
    length += 8 * object.x_robots.length;
    length += 8 * object.y_robots.length;
    length += object.for_humans.length;
    length += object.for_robots.length;
    length += _getByteLength(object.file_path);
    return length + 33;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_sfm_plugin/LoadTasksRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e2f7b35aeaa37e86fdac63440aae097';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] task_names
    float64[] x_humans
    float64[] y_humans
    float64[] x_robots
    float64[] y_robots
    bool[] for_humans
    bool[] for_robots
    bool use_file
    string file_path
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadTasksRequest(null);
    if (msg.task_names !== undefined) {
      resolved.task_names = msg.task_names;
    }
    else {
      resolved.task_names = []
    }

    if (msg.x_humans !== undefined) {
      resolved.x_humans = msg.x_humans;
    }
    else {
      resolved.x_humans = []
    }

    if (msg.y_humans !== undefined) {
      resolved.y_humans = msg.y_humans;
    }
    else {
      resolved.y_humans = []
    }

    if (msg.x_robots !== undefined) {
      resolved.x_robots = msg.x_robots;
    }
    else {
      resolved.x_robots = []
    }

    if (msg.y_robots !== undefined) {
      resolved.y_robots = msg.y_robots;
    }
    else {
      resolved.y_robots = []
    }

    if (msg.for_humans !== undefined) {
      resolved.for_humans = msg.for_humans;
    }
    else {
      resolved.for_humans = []
    }

    if (msg.for_robots !== undefined) {
      resolved.for_robots = msg.for_robots;
    }
    else {
      resolved.for_robots = []
    }

    if (msg.use_file !== undefined) {
      resolved.use_file = msg.use_file;
    }
    else {
      resolved.use_file = false
    }

    if (msg.file_path !== undefined) {
      resolved.file_path = msg.file_path;
    }
    else {
      resolved.file_path = ''
    }

    return resolved;
    }
};

class LoadTasksResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadTasksResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadTasksResponse
    let len;
    let data = new LoadTasksResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_sfm_plugin/LoadTasksResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadTasksResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: LoadTasksRequest,
  Response: LoadTasksResponse,
  md5sum() { return 'deda9a7b2b857b0ae878e4665876836b'; },
  datatype() { return 'gazebo_sfm_plugin/LoadTasks'; }
};
