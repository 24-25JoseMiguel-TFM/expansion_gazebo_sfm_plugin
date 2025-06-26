// Auto-generated. Do not edit!

// (in-package gazebo_sfm_plugin.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class LoadTasksRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.use_file = null;
      this.file_path = null;
      this.task_names = null;
      this.positions = null;
      this.target_types = null;
    }
    else {
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
      if (initObj.hasOwnProperty('task_names')) {
        this.task_names = initObj.task_names
      }
      else {
        this.task_names = [];
      }
      if (initObj.hasOwnProperty('positions')) {
        this.positions = initObj.positions
      }
      else {
        this.positions = [];
      }
      if (initObj.hasOwnProperty('target_types')) {
        this.target_types = initObj.target_types
      }
      else {
        this.target_types = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadTasksRequest
    // Serialize message field [use_file]
    bufferOffset = _serializer.bool(obj.use_file, buffer, bufferOffset);
    // Serialize message field [file_path]
    bufferOffset = _serializer.string(obj.file_path, buffer, bufferOffset);
    // Serialize message field [task_names]
    bufferOffset = _arraySerializer.string(obj.task_names, buffer, bufferOffset, null);
    // Serialize message field [positions]
    // Serialize the length for message field [positions]
    bufferOffset = _serializer.uint32(obj.positions.length, buffer, bufferOffset);
    obj.positions.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [target_types]
    bufferOffset = _arraySerializer.string(obj.target_types, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadTasksRequest
    let len;
    let data = new LoadTasksRequest(null);
    // Deserialize message field [use_file]
    data.use_file = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [file_path]
    data.file_path = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [task_names]
    data.task_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [positions]
    // Deserialize array length for message field [positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.positions[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [target_types]
    data.target_types = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.file_path);
    object.task_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 24 * object.positions.length;
    object.target_types.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gazebo_sfm_plugin/LoadTasksRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb4b966d20833cec6bbbed888bd4dd89';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool use_file
    string file_path
    string[] task_names
    geometry_msgs/Point[] positions
    string[] target_types
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadTasksRequest(null);
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

    if (msg.task_names !== undefined) {
      resolved.task_names = msg.task_names;
    }
    else {
      resolved.task_names = []
    }

    if (msg.positions !== undefined) {
      resolved.positions = new Array(msg.positions.length);
      for (let i = 0; i < resolved.positions.length; ++i) {
        resolved.positions[i] = geometry_msgs.msg.Point.Resolve(msg.positions[i]);
      }
    }
    else {
      resolved.positions = []
    }

    if (msg.target_types !== undefined) {
      resolved.target_types = msg.target_types;
    }
    else {
      resolved.target_types = []
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
  md5sum() { return '3b67f7d0c861348ae151a1487a64fe7e'; },
  datatype() { return 'gazebo_sfm_plugin/LoadTasks'; }
};
