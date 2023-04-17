/// @file
/// @brief

#pragma once

#include <boost/thread/mutex.hpp>


namespace alexen {
namespace libs {
namespace funcs {


void funcA( boost::mutex& );


void funcB( boost::mutex& );


void funcC( boost::mutex& );


} // namespace funcs
} // namespace libs
} // namespace alexen
