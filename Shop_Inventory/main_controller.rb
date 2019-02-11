require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/products_by_wholesaler_controller')
require_relative('controllers/wholesalers_controller')

get '/' do
  erb( :index )
end
