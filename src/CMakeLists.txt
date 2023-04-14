add_executable(${PROJECT_NAME}
     main.cpp
)
target_link_libraries(${PROJECT_NAME}
     boost_thread
     boost_filesystem
     ${CMAKE_THREAD_LIBS_INIT}
)
