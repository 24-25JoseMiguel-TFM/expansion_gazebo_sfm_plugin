# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "gazebo_sfm_plugin: 8 messages, 3 services")

set(MSG_I_FLAGS "-Igazebo_sfm_plugin:/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg;-Igazebo_sfm_plugin:/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Igazebo_msgs:/opt/ros/noetic/share/gazebo_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(gazebo_sfm_plugin_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" ""
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" "std_msgs/Header:gazebo_sfm_plugin/TaskAssignmentFeedback:gazebo_sfm_plugin/TaskAssignmentActionGoal:gazebo_sfm_plugin/TaskAssignmentResult:gazebo_sfm_plugin/TaskAssignmentActionFeedback:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:gazebo_sfm_plugin/TaskAssignmentActionResult:gazebo_sfm_plugin/TaskAssignmentGoal:geometry_msgs/Point"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" "geometry_msgs/Point:std_msgs/Header:gazebo_sfm_plugin/TaskAssignmentGoal:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:gazebo_sfm_plugin/TaskAssignmentResult:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:gazebo_sfm_plugin/TaskAssignmentFeedback:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" ""
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" ""
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" ""
)

get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_custom_target(_gazebo_sfm_plugin_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gazebo_sfm_plugin" "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" "geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Services
_generate_srv_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_cpp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Module File
_generate_module_cpp(gazebo_sfm_plugin
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(gazebo_sfm_plugin_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(gazebo_sfm_plugin_generate_messages gazebo_sfm_plugin_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_cpp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gazebo_sfm_plugin_gencpp)
add_dependencies(gazebo_sfm_plugin_gencpp gazebo_sfm_plugin_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gazebo_sfm_plugin_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Services
_generate_srv_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_eus(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Module File
_generate_module_eus(gazebo_sfm_plugin
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(gazebo_sfm_plugin_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(gazebo_sfm_plugin_generate_messages gazebo_sfm_plugin_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_eus _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gazebo_sfm_plugin_geneus)
add_dependencies(gazebo_sfm_plugin_geneus gazebo_sfm_plugin_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gazebo_sfm_plugin_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Services
_generate_srv_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_lisp(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Module File
_generate_module_lisp(gazebo_sfm_plugin
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(gazebo_sfm_plugin_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(gazebo_sfm_plugin_generate_messages gazebo_sfm_plugin_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_lisp _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gazebo_sfm_plugin_genlisp)
add_dependencies(gazebo_sfm_plugin_genlisp gazebo_sfm_plugin_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gazebo_sfm_plugin_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Services
_generate_srv_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_nodejs(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Module File
_generate_module_nodejs(gazebo_sfm_plugin
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(gazebo_sfm_plugin_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(gazebo_sfm_plugin_generate_messages gazebo_sfm_plugin_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gazebo_sfm_plugin_gennodejs)
add_dependencies(gazebo_sfm_plugin_gennodejs gazebo_sfm_plugin_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gazebo_sfm_plugin_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_msg_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Services
_generate_srv_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)
_generate_srv_py(gazebo_sfm_plugin
  "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
)

### Generating Module File
_generate_module_py(gazebo_sfm_plugin
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(gazebo_sfm_plugin_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(gazebo_sfm_plugin_generate_messages gazebo_sfm_plugin_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv" NAME_WE)
add_dependencies(gazebo_sfm_plugin_generate_messages_py _gazebo_sfm_plugin_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gazebo_sfm_plugin_genpy)
add_dependencies(gazebo_sfm_plugin_genpy gazebo_sfm_plugin_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gazebo_sfm_plugin_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gazebo_sfm_plugin
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET gazebo_msgs_generate_messages_cpp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_cpp gazebo_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gazebo_sfm_plugin
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(gazebo_sfm_plugin_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(gazebo_sfm_plugin_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(gazebo_sfm_plugin_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET gazebo_msgs_generate_messages_eus)
  add_dependencies(gazebo_sfm_plugin_generate_messages_eus gazebo_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gazebo_sfm_plugin
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET gazebo_msgs_generate_messages_lisp)
  add_dependencies(gazebo_sfm_plugin_generate_messages_lisp gazebo_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gazebo_sfm_plugin
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET gazebo_msgs_generate_messages_nodejs)
  add_dependencies(gazebo_sfm_plugin_generate_messages_nodejs gazebo_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gazebo_sfm_plugin
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(gazebo_sfm_plugin_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(gazebo_sfm_plugin_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(gazebo_sfm_plugin_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET gazebo_msgs_generate_messages_py)
  add_dependencies(gazebo_sfm_plugin_generate_messages_py gazebo_msgs_generate_messages_py)
endif()
