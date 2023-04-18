cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project(cmake_external_project)

option(BUILD_SHARED_LIBS "Build shared libs by default" ON)

set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)

set(CONTRIB_BINARY_DIR ${CMAKE_BINARY_DIR}/_build)

add_subdirectory(contribs)

include_directories(${CONTRIB_BINARY_DIR}/include)
link_directories(${CONTRIB_BINARY_DIR}/lib)

install(
     DIRECTORY ${CONTRIB_BINARY_DIR}/lib
     DESTINATION ${CMAKE_INSTALL_PREFIX}
     USE_SOURCE_PERMISSIONS
)

find_package(Threads REQUIRED)

include_directories(src)
add_subdirectory(src)

add_dependencies(${PROJECT_NAME} contribs)

install(TARGETS ${PROJECT_NAME})

set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "InfoTeCS Internet Trust")
set(CPACK_DEBIAN_PACKAGE_VERSION "1.1.0")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_DEBIAN_PACKAGE_FILE_NAME "${PROJECT_NAME}-${CPACK_DEBIAN_PACKAGE_VERSION}-${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_DEBIAN_PACKAGE_FILE_NAME}")
#set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

include(CPack)