cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")
include_directories(
    ${CMAKE_SOURCE_DIR}/src-gen
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/capicxx-core-runtime/include
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/include
#    $ENV{DBUS_PATH}
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/dbus-1.10.10
    
)
link_directories(
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/capicxx-core-runtime/build
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/build
#    $ENV{DBUS_PATH}/dbus/.libs
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/dbus-1.10.10/final/usr/local/lib

)
add_executable(HelloWorldClient
	src/HelloWorldClient.cpp
	src-gen/v1/commonapi/HelloWorldDBusProxy.cpp
	src-gen/v1/commonapi/HelloWorldDBusDeployment
)
target_link_libraries(HelloWorldClient CommonAPI CommonAPI-DBus dbus-1)
add_executable(HelloWorldService
	src/HelloWorldService.cpp
	src/HelloWorldStubImpl.cpp
	src-gen/v1/commonapi/HelloWorldDBusStubAdapter.cpp
	src-gen/v1/commonapi/HelloWorldStubDefault
	src-gen/v1/commonapi/HelloWorldDBusDeployment
)
target_link_libraries(HelloWorldService CommonAPI CommonAPI-DBus dbus-1)
