cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")
include_directories(
    ${CMAKE_SOURCE_DIR}/src-gen
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-core-runtime/include
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/include
#    $ENV{DBUS_PATH}
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/dbus-1.10.10/final/include/dbus-1.0
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/dbus-1.10.10/final/lib/dbus-1.0/include
    
)
link_directories(
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-core-runtime/build
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/capicxx-dbus-runtime/build
#    $ENV{DBUS_PATH}/dbus/.libs
    ${CMAKE_SOURCE_DIR}/../tools/VM_CommonAPI_C++/dbus-1.10.10/final/lib

)
add_executable(HelloWorldClient
	src/E01HelloWorldClient.cpp
	src-gen/v0/commonapi/examples/E01HelloWorldDBusProxy.cpp
	src-gen/v0/commonapi/examples/E01HelloWorldDBusDeployment.cpp
)
target_link_libraries(HelloWorldClient CommonAPI CommonAPI-DBus dbus-1)

add_executable(HelloWorldService
	src/E01HelloWorldService.cpp
	src/E01HelloWorldStubImpl.cpp
	src-gen/v0/commonapi/examples/E01HelloWorldDBusStubAdapter.cpp
	src-gen/v0/commonapi/examples/E01HelloWorldStubDefault.cpp
	src-gen/v0/commonapi/examples/E01HelloWorldDBusDeployment.cpp
)
target_link_libraries(HelloWorldService CommonAPI CommonAPI-DBus dbus-1)
