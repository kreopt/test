cmake_minimum_required(VERSION 2.8)
project(test)

add_definitions(-std=c++1z -fcheck-new -fno-rtti)# -Os

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(BUILD_TEST "should build tests" ON)

if (BUILD_TEST)
    add_definitions(-DTESTING )

    set(TEST_FILES
            test/catch.hpp
            test/test_main.cpp)
    add_executable(${PROJECT_NAME}Test ${TEST_FILES} ${SOURCE_FILES})
    target_link_libraries(${PROJECT_NAME}Test pthread)
endif()
