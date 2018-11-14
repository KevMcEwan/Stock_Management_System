require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/product.rb' )
require_relative( './models/wholesaler.rb' )
require_relative( './models/stock_supply.rb')
also_reload( './models/*' )


get '/' do
  erb(:index)
end

get '/products' do
  @products = Product.all
  erb( :"products/products")
end

get '/products/re-stock_required' do
  @products = Product.stock_order
  erb( :"products/re-stock_required")
end

get '/products/profit_margin' do
  @products = Product.all
  erb( :"products/profit_margin")
end

get '/products/add_new_product' do
  erb( :"products/add_new_product" )
end

post '/products' do
  @product = Product.new( params )
  @product.save
  redirect to '/products'
end

get '/products/:id' do
  @product = Product.find( params[:id] )
  erb( :"/products/productinfo" )
end

get '/products/:id/editproduct' do
  @product = Product.find( params[:id] )
  erb( :"products/editproduct" )
end

post '/products/:id' do
  Product.new(params).update
  redirect to '/products'
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products'
end



get '/stock_supply' do
  @stock_supply = Stock_supply.all
  erb (:"stock_supply/stock_supply")
end

get '/stock_supply/add_new_supply_product' do
  erb( :"stock_supply/add_new_supply_product" )
end

post '/stock_supply' do
  @stock_supply = Stock_supply.new( params )
  @stock_supply.save
  redirect to '/stock_supply'
end
#
get '/stock_supply/:id' do
  @stock_supply = Stock_supply.find( params[:id] )
  erb( :"/stock_supply/stock_supply_info" )
end

# get '/stock_supply/:id/edit_stock_supply' do
#   @stock_supply = Stock_supply.find( params[:id] )
#   erb( :"stock_supply/edit_stock_supply" )
# end
#
# post '/stock_supply/:id' do
#   Stock_supply.new(params).update
#   redirect to '/stock_supply'
# end
#
# post '/stock_supply/:id/delete' do
#   stock_supply = Stock_supply.find( params[:id] )
#   stock_supply.delete()
#   redirect to '/stock_supply'
# end



get '/wholesalers' do
  @wholesalers = Wholesaler.all
  erb (:"wholesalers/wholesalers")
end

get '/wholesalers/add_new_wholesaler' do
  erb( :"wholesalers/add_new_wholesaler" )
end

post '/wholesalers' do
  @wholesaler = Wholesaler.new( params )
  @wholesaler.save
  redirect to '/wholesalers'
end

get '/wholesalers/:id' do
  @wholesaler = Wholesaler.find( params[:id] )
  erb( :"/wholesalers/wholesaler_info" )
end

get '/wholesalers/:id/editwholesaler' do
  @wholesaler = Wholesaler.find( params[:id] )
  erb( :"wholesalers/editwholesaler" )
end

post '/wholesalers/:id' do
  Wholesaler.new(params).update
  redirect to '/wholesalers'
end

post '/wholesalers/:id/delete' do
  wholesaler = Wholesaler.find( params[:id] )
  wholesaler.delete()
  redirect to '/wholesalers'
end
