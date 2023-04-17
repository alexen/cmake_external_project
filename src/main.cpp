/// @file
/// @brief

#include <stdexcept>
#include <iostream>

#include <boost/thread.hpp>
#include <boost/filesystem.hpp>
#include <boost/core/ignore_unused.hpp>
#include <boost/exception/diagnostic_information.hpp>

#include <libs/funcs.h>


int main( int argc, char** argv )
{
     boost::ignore_unused( argc, argv );
     try
     {
          boost::mutex m;
          boost::thread_group tg;
          for( auto i=0; i<4; ++i )
          {
               tg.create_thread( [ &m ]{
                    alexen::libs::funcs::funcA( m );
               } );
               tg.create_thread( [ &m ]{
                    alexen::libs::funcs::funcB( m );
               } );
               tg.create_thread( [ &m ]{
                    alexen::libs::funcs::funcC( m );
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
