cmake_minimum_required(VERSION 3.0.2)
project(gazebo_sfm_plugin)

# ========== Basic Configuration ==========
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ========== Dependencies ==========
find_package(catkin REQUIRED COMPONENTS
  gazebo_ros
  roscpp
  geometry_msgs
  message_generation
  dynamic_reconfigure
  std_msgs
  message_runtime 
)

find_package(Boost REQUIRED COMPONENTS thread system)
find_package(gazebo REQUIRED)

# ========== Message Generation ==========
add_service_files(
  FILES
  Update_waypoint.srv
  Return_home.srv
  AssignTask.srv
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
  std_msgs
)

generate_dynamic_reconfigure_options(
  cfg/PedestrianSFMPlugin.cfg
)

# ========== Package Configuration ==========
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES PedestrianSFMPlugin
  CATKIN_DEPENDS 
    gazebo_ros 
    roscpp 
    geometry_msgs 
    message_runtime 
    dynamic_reconfigure
  DEPENDS Boost GAZEBO
)

# ========== Include Directories ==========
include_directories(include)
include_directories(SYSTEM
  ${Boost_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
  ${GAZEBO_INCLUDE_DIRS}
)

# ========== Main Targets ==========
add_library(PedestrianSFMPlugin src/PedestrianSFMPlugin.cpp)
target_link_libraries(PedestrianSFMPlugin
  ${catkin_LIBRARIES}
  ${GAZEBO_LIBRARIES}
  ${Boost_LIBRARIES} 
)

# Task Coordinator executable
add_executable(task_coordinator src/TaskCoordinator.cpp)
add_dependencies(task_coordinator
  ${PROJECT_NAME}_gencpp
  ${catkin_EXPORTED_TARGETS}
  ${PROJECT_NAME}_generate_messages_cpp
)
target_link_libraries(task_coordinator
  ${catkin_LIBRARIES}
)

# ========== Installation ==========
install(TARGETS
  PedestrianSFMPlugin
  task_coordinator
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)

install(FILES
  Update_waypoint.srv
  Return_home.srv
  AssignTask.srv
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)