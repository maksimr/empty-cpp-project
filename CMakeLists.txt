cmake_minimum_required(VERSION 3.15)

set(VCPKG_ROOT "$ENV{VCPKG_ROOT}")
if(NOT VCPKG_ROOT)
    set(VCPKG_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/.vcpkg")
endif()

set(CMAKE_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")

project(EmptyCppProject)

find_package(fmt REQUIRED)

file(GLOB_RECURSE SOURCES "src/*.cpp")
add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)