// Generated by gencpp from file gazebo_sfm_plugin/Update_waypointRequest.msg
// DO NOT EDIT!


#ifndef GAZEBO_SFM_PLUGIN_MESSAGE_UPDATE_WAYPOINTREQUEST_H
#define GAZEBO_SFM_PLUGIN_MESSAGE_UPDATE_WAYPOINTREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace gazebo_sfm_plugin
{
template <class ContainerAllocator>
struct Update_waypointRequest_
{
  typedef Update_waypointRequest_<ContainerAllocator> Type;

  Update_waypointRequest_()
    : waypoints()
    , task_name()  {
    }
  Update_waypointRequest_(const ContainerAllocator& _alloc)
    : waypoints(_alloc)
    , task_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Point_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::geometry_msgs::Point_<ContainerAllocator> >> _waypoints_type;
  _waypoints_type waypoints;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _task_name_type;
  _task_name_type task_name;





  typedef boost::shared_ptr< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> const> ConstPtr;

}; // struct Update_waypointRequest_

typedef ::gazebo_sfm_plugin::Update_waypointRequest_<std::allocator<void> > Update_waypointRequest;

typedef boost::shared_ptr< ::gazebo_sfm_plugin::Update_waypointRequest > Update_waypointRequestPtr;
typedef boost::shared_ptr< ::gazebo_sfm_plugin::Update_waypointRequest const> Update_waypointRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator1> & lhs, const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator2> & rhs)
{
  return lhs.waypoints == rhs.waypoints &&
    lhs.task_name == rhs.task_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator1> & lhs, const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace gazebo_sfm_plugin

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ff528316f30ce0dbcbe264c018c709a7";
  }

  static const char* value(const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xff528316f30ce0dbULL;
  static const uint64_t static_value2 = 0xcbe264c018c709a7ULL;
};

template<class ContainerAllocator>
struct DataType< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gazebo_sfm_plugin/Update_waypointRequest";
  }

  static const char* value(const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point[] waypoints\n"
"string task_name\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.waypoints);
      stream.next(m.task_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Update_waypointRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gazebo_sfm_plugin::Update_waypointRequest_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "waypoints: ";
    if (v.waypoints.empty() || false)
      s << "[";
    for (size_t i = 0; i < v.waypoints.size(); ++i)
    {
      if (false && i > 0)
        s << ", ";
      else if (!false)
        s << std::endl << indent << "  -";
      Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, false ? std::string() : indent + "    ", v.waypoints[i]);
    }
    if (v.waypoints.empty() || false)
      s << "]";
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "task_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.task_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GAZEBO_SFM_PLUGIN_MESSAGE_UPDATE_WAYPOINTREQUEST_H
