cmake_minimum_required(VERSION 3.0.2)
project(gazebo_sfm_plugin)

# ========== Compiler Configuration ==========
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ========== Dependencies ==========
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs
  gazebo_ros
  actionlib
  actionlib_msgs
  message_generation
  dynamic_reconfigure
  gazebo_msgs
)

find_package(Boost REQUIRED COMPONENTS thread system)
find_package(gazebo REQUIRED)
find_package(yaml-cpp 0.6 REQUIRED)  # Explicit version specification

# ========== Message/Service/Action Definitions ==========
add_message_files(
  FILES
  Task.msg
)

add_service_files(
  FILES
  Update_waypoint.srv
  Return_home.srv
  LoadTasks.srv
)

add_action_files(
  FILES
  TaskAssignment.action
)

# ========== Generate Messages ==========
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  actionlib_msgs
  gazebo_msgs
)

# ========== Dynamic Reconfigure ==========
generate_dynamic_reconfigure_options(
  cfg/PedestrianSFMPlugin.cfg
)

# ========== Catkin Package Configuration ==========
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES 
    PedestrianSFMPlugin
  CATKIN_DEPENDS
    roscpp
    std_msgs
    geometry_msgs
    actionlib
    actionlib_msgs
    message_runtime
    dynamic_reconfigure
    gazebo_msgs
  DEPENDS 
    Boost 
    GAZEBO 
    yaml-cpp
)

# ========== Include Directories ==========
include_directories(
  include
  ${Boost_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
  ${GAZEBO_INCLUDE_DIRS}
  ${YAML_CPP_INCLUDE_DIR}  # Explicit include path
  ${CMAKE_CURRENT_BINARY_DIR}
  ${CATKIN_DEVEL_PREFIX}/include
)

# ========== Plugin Library ==========
add_library(PedestrianSFMPlugin
  src/PedestrianSFMPlugin.cpp
)

target_link_libraries(PedestrianSFMPlugin
  ${catkin_LIBRARIES}
  ${GAZEBO_LIBRARIES}
  ${Boost_LIBRARIES}
  yaml-cpp  # Modern target-based linking
)

add_dependencies(PedestrianSFMPlugin
  ${PROJECT_NAME}_gencpp
  ${catkin_EXPORTED_TARGETS}
)

# ========== Task Coordinator Node ==========
add_executable(task_coordinator
  src/TaskCoordinator.cpp
)

target_link_libraries(task_coordinator
  ${catkin_LIBRARIES}
  ${Boost_LIBRARIES}
  yaml-cpp  # Modern target-based linking
  ${GAZEBO_LIBRARIES}
)

add_dependencies(task_coordinator
  ${PROJECT_NAME}_gencpp
  ${catkin_EXPORTED_TARGETS}
)

# ========== Cafe Robot System Node ==========
add_executable(cafe_robot_system
  src/CafeRobotSystem.cpp
)

target_link_libraries(cafe_robot_system
  ${catkin_LIBRARIES}
  ${Boost_LIBRARIES}
)

add_dependencies(cafe_robot_system
  ${PROJECT_NAME}_gencpp
  ${catkin_EXPORTED_TARGETS}
)

# ========== Installation ==========
install(TARGETS
  PedestrianSFMPlugin
  task_coordinator
  cafe_robot_system
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  PATTERN ".svn" EXCLUDE
)

install(FILES
  srv/Update_waypoint.srv
  srv/Return_home.srv
  srv/LoadTasks.srv
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/srv
)

install(FILES
  msg/Task.msg
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/msg
)

install(FILES
  action/TaskAssignment.action
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/action
)