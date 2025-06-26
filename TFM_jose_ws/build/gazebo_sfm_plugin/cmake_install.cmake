# Install script for directory: /home/jose/TFM_jose_ws/src/gazebo_sfm_plugin

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jose/TFM_jose_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/msg" TYPE FILE FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/srv" TYPE FILE FILES
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/action" TYPE FILE FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/action/TaskAssignment.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/msg" TYPE FILE FILES
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentAction.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionGoal.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionResult.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentActionFeedback.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentGoal.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentResult.msg"
    "/home/jose/TFM_jose_ws/devel/share/gazebo_sfm_plugin/msg/TaskAssignmentFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/cmake" TYPE FILE FILES "/home/jose/TFM_jose_ws/build/gazebo_sfm_plugin/catkin_generated/installspace/gazebo_sfm_plugin-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/include/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/share/roseus/ros/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/share/common-lisp/ros/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/share/gennodejs/ros/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jose/TFM_jose_ws/devel/lib/python3/dist-packages/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/lib/python3/dist-packages/gazebo_sfm_plugin")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gazebo_sfm_plugin" TYPE FILE FILES "/home/jose/TFM_jose_ws/devel/include/gazebo_sfm_plugin/PedestrianSFMPluginConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/gazebo_sfm_plugin" TYPE FILE FILES "/home/jose/TFM_jose_ws/devel/lib/python3/dist-packages/gazebo_sfm_plugin/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jose/TFM_jose_ws/devel/lib/python3/dist-packages/gazebo_sfm_plugin/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/gazebo_sfm_plugin" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/devel/lib/python3/dist-packages/gazebo_sfm_plugin/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jose/TFM_jose_ws/build/gazebo_sfm_plugin/catkin_generated/installspace/gazebo_sfm_plugin.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/cmake" TYPE FILE FILES "/home/jose/TFM_jose_ws/build/gazebo_sfm_plugin/catkin_generated/installspace/gazebo_sfm_plugin-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/cmake" TYPE FILE FILES
    "/home/jose/TFM_jose_ws/build/gazebo_sfm_plugin/catkin_generated/installspace/gazebo_sfm_pluginConfig.cmake"
    "/home/jose/TFM_jose_ws/build/gazebo_sfm_plugin/catkin_generated/installspace/gazebo_sfm_pluginConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin" TYPE FILE FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/jose/TFM_jose_ws/devel/lib/libPedestrianSFMPlugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libPedestrianSFMPlugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin" TYPE EXECUTABLE FILES "/home/jose/TFM_jose_ws/devel/lib/gazebo_sfm_plugin/task_coordinator")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gazebo_sfm_plugin/task_coordinator")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gazebo_sfm_plugin" TYPE DIRECTORY FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/include/gazebo_sfm_plugin/" REGEX "/\\.svn$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/srv" TYPE FILE FILES
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Update_waypoint.srv"
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/Return_home.srv"
    "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/srv/LoadTasks.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/msg" TYPE FILE FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/msg/Task.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_sfm_plugin/action" TYPE FILE FILES "/home/jose/TFM_jose_ws/src/gazebo_sfm_plugin/action/TaskAssignment.action")
endif()

