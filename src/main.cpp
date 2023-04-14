/// @file
/// @brief

#include <stdexcept>
#include <iostream>

#include <boost/thread.hpp>
#include <boost/filesystem.hpp>
#include <boost/core/ignore_unused.hpp>
#include <boost/exception/diagnostic_information.hpp>

int main( int argc, char** argv )
{
     boost::ignore_unused( argc, argv );
     try
     {
          boost::thread_group tg;
          for( auto i=0; i<4; ++i )
          {
               tg.create_thread( []{
                    std::cout << "Hello! I am thread " << boost::this_thread::get_id() << std::endl;
                    if( boost::filesystem::exists( "/home/alexen/.bashrc" ) )
                    {
                         std::cout << "Thread " << boost::this_thread::get_id()
                              << " says file exists!" << std::endl;
                    }
               } );
          }
          tg.join_all();
     }
     catch( const std::exception& e )
     {
          std::cerr << "exception: " << boost::diagnostic_information( e ) << '\n';
          return 1;
     }
     return 0;
}
