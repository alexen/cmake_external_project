set(CONTRIB_NAME    "boost")
set(CONTRIB_URL     "file:///home/alexen/worktrash/apps/trust_plugin/boost_1_72_0.tar.bz2")
set(CONTRIB_SHA256  "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722")

set(CONFIGURE_OPTIONS
     --prefix=${CONTRIB_BINARY_DIR}
)

set(BUILD_OPTIONS
     variant=release
     threading=multi
     --disable-icu
     --with-system
     --with-filesystem
     --with-regex
     --with-date_time
     --with-program_options
     --with-log
     --with-serialization
)
if(BUILD_SHARED_LIBS)
     list(APPEND BUILD_OPTIONS
          link=shared
          runtime-link=shared
     )
else()
     list(APPEND BUILD_OPTIONS
          link=static
          runtime-link=static
     )
endif()

if(CMAKE_INSTALL_RPATH)
     list(APPEND BUILD_OPTIONS
          linkflags=-Wl,-rpath,${CMAKE_INSTALL_RPATH}
     )
endif()

include(CMakePrintHelpers)
cmake_print_variables(CMAKE_C_FLAGS CMAKE_CXX_FLAGS CMAKE_INSTALL_RPATH BUILD_OPTIONS)

include(ProcessorCount)
ProcessorCount(NCPU)

ExternalProject_Add(${CONTRIB_NAME}
     URL               ${CONTRIB_URL}
     URL_HASH          SHA256=${CONTRIB_SHA256}
     UPDATE_COMMAND    ""
     PATCH_COMMAND     ""
     BUILD_IN_SOURCE   ON
     CONFIGURE_COMMAND ./bootstrap.sh ${CONFIGURE_OPTIONS}
     BUILD_COMMAND     ./b2 ${BUILD_OPTIONS} -j${NCPU} install
     INSTALL_COMMAND   ""
)
