/// @file
/// @brief

#include "funcs.h"

#include <iostream>
#include <boost/thread/thread.hpp>


namespace alexen {
namespace libs {
namespace funcs {

void funcA( boost::mutex& m )
{
     boost::unique_lock< boost::mutex > lock{ m };
     std::cout << boost::this_thread::get_id()
          << "Function " << __FUNCTION__ << " says HI!" << std::endl;
}


void funcB( boost::mutex& m )
{
     boost::unique_lock< boost::mutex > lock{ m };
     std::cout << boost::this_thread::get_id()
          << "Function " << __FUNCTION__ << " says HO-HO-HO!" << std::endl;
}


void funcC( boost::mutex& m )
{
     boost::unique_lock< boost::mutex > lock{ m };
     std::cout << boost::this_thread::get_id()
          << "Function " << __FUNCTION__ << " says KAWABANGA!" << std::endl;
}


} // namespace funcs
} // namespace libs
} // namespace alexen
