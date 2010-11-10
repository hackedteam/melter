cmake_minimum_required (VERSION 2.6)
cmake_policy(SET CMP0015 NEW)

set (melter_VERSION_MAJOR 0)
set (melter_VERSION_MINOR 1)

if(DEFINED CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "Choose the type of build, options are: Debug Release")
else()
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build, options are: Debug Release")
endif()

project(melter CXX)

message("-- Building melter (${CMAKE_BUILD_TYPE}), version ${libpemelter_VERSION_MAJOR}.${libpemelter_VERSION_MINOR}")

configure_file (
    "${PROJECT_SOURCE_DIR}/version.h.in"
    "${PROJECT_BINARY_DIR}/version.h"
)

include_directories("${PROJECT_SOURCE_DIR}")
include_directories("${PROJECT_BINARY_DIR}")

option(WITH_TESTS "Build unit tests" ON)
if (WITH_TESTS)
    message("-- Unit tests will be built (use make test to execute).")
	#add_subdirectory(tests)
endif()

set(CMAKE_CXX_FLAGS_DEBUG "-g -O2 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

# settings for Microsoft Visual C++
IF(CMAKE_CXX_COMPILER MATCHES "CL|cl")
  include_directories("c:\\win32-deps\\boost\\boost_1_44")
  IF(NOT WITH_SHARED_LIBS)
    IF(CMAKE_GENERATOR STREQUAL "Visual Studio 6")
      SET(CMAKE_CXX_FLAGS "/nologo /W3 /GX /Gy /YX")
      SET(CMAKE_CXX_FLAGS_DEBUG "/MTd /Z7 /Od")
      SET(CMAKE_CXX_FLAGS_RELEASE "/MT /O2")
      SET(CMAKE_CXX_FLAGS_MINSIZEREL "/MT /O2")
      SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MTd /Z7 /Od")
    ENDIF(CMAKE_GENERATOR STREQUAL "Visual Studio 6")
    IF(CMAKE_GENERATOR STREQUAL "Visual Studio 7" OR CMAKE_GENERATOR STREQUAL "Visual Studio 7 .NET 2003")
      SET(CMAKE_CXX_FLAGS "/nologo /W3 /Gy")
      SET(CMAKE_CXX_FLAGS_DEBUG "/MTd /Z7 /Od")
      SET(CMAKE_CXX_FLAGS_RELEASE "/MT /O2")
      SET(CMAKE_CXX_FLAGS_MINSIZEREL "/MT /O2")
      SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MTd /Z7 /Od")
    ENDIF(CMAKE_GENERATOR STREQUAL "Visual Studio 7" OR CMAKE_GENERATOR STREQUAL "Visual Studio 7 .NET 2003")
    IF(CMAKE_GENERATOR STREQUAL "Visual Studio 8 2005" 
		OR CMAKE_GENERATOR STREQUAL "Visual Studio 9 2008"
		OR CMAKE_GENERATOR STREQUAL "Visual Studio 10")
      SET(CMAKE_CXX_FLAGS "/nologo /W3 /Gy /EHsc")
      SET(CMAKE_CXX_FLAGS_DEBUG "/MTd /Z7 /Od")
      SET(CMAKE_CXX_FLAGS_RELEASE "/MT /O2")
      SET(CMAKE_CXX_FLAGS_MINSIZEREL "/MT /O2")
      SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MTd /Z7 /Od")
    ENDIF(CMAKE_GENERATOR STREQUAL "Visual Studio 8 2005" 
		OR CMAKE_GENERATOR STREQUAL "Visual Studio 9 2008"
		OR CMAKE_GENERATOR STREQUAL "Visual Studio 10")
  ENDIF(NOT WITH_SHARED_LIBS)
ENDIF(CMAKE_CXX_COMPILER MATCHES "CL|cl")

set(melter_SOURCES main.cc)

include_directories("../libpemelter" "../melter")

add_executable(melter ${melter_SOURCES})
target_link_libraries(melter pemelter crypto boost_system-mt)
