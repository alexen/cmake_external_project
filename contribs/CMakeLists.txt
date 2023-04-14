include(ExternalProject)

include(boost.cmake)
include(xml-security-c.cmake)

add_custom_target(contribs DEPENDS boost xml-security-c)