require './config/environment'

use Rack::MethodOverride
use BooksController 
use BookshelvesController  
use UsersController   
run ApplicationController