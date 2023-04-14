cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project(using_external_project)

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

add_subdirectory(src)

add_dependencies(${PROJECT_NAME} contribs)

install(TARGETS ${PROJECT_NAME})
