set(CONTRIB_NAME    "xml-security-c")
set(CONTRIB_URL     "file:///home/alexen/worktrash/apps/trust_plugin/xml-security-c-1.7.3.tar.bz2")
set(CONTRIB_SHA256  "09a1165c2cfcd468dbc170935db10861107dfa22e02754092473c0f555ef6819")

include(ProcessorCount)
ProcessorCount(NCPU)

set(OPENSSL_DIR /opt/itcs)

set(CONFIGURE_OPTIONS
     --prefix=${CONTRIB_BINARY_DIR}
     --with-openssl=${OPENSSL_DIR}
     LDFLAGS=-Wl,-rpath,${OPENSSL_DIR}/lib
)
if(BUILD_SHARED_LIBS)
     list(APPEND CONFIGURE_OPTIONS
          --enable-shared
          --disable-static
     )
else()
     list(APPEND CONFIGURE_OPTIONS
          --enable-static
          --disable-shared
     )
endif()
if(CMAKE_INSTALL_RPATH)
     list(APPEND CONFIGURE_OPTIONS
          LDFLAGS=-Wl,-rpath,${CMAKE_INSTALL_RPATH}
     )
endif()

include(CMakePrintHelpers)
cmake_print_variables(
     CMAKE_C_FLAGS
     CMAKE_CXX_FLAGS
     CMAKE_INSTALL_RPATH
     CONFIGURE_OPTIONS
)

ExternalProject_Add(${CONTRIB_NAME}
     URL                 ${CONTRIB_URL}
     URL_HASH            SHA256=${CONTRIB_SHA256}
     PATCH_COMMAND       patch --ignore-whitespace -p1 < ${CMAKE_SOURCE_DIR}/contribs/patches/01-xml-security-c.patch
     CONFIGURE_COMMAND   ./configure ${CONFIGURE_OPTIONS}
     BUILD_IN_SOURCE     ON
     BUILD_COMMAND       make -j${NCPU}
     INSTALL_COMMAND     make install
)
