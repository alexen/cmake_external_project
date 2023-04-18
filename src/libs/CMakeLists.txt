set(LIBNAME funcs)

add_library(${LIBNAME} funcs.cpp)
target_link_libraries(${LIBNAME}
     boost_thread
     ${CMAKE_THREAD_LIBS_INIT}
)
add_dependencies(${LIBNAME} boost)

install(TARGETS ${LIBNAME})
