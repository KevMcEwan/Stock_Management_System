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


post '/products/:id' do
  Product.new(params).update
  redirect to '/products/profit_margin'
end


get '/products/:id/editproduct' do
  @product = Product.find( params[:id] )
  erb( :"products/editproduct" )
end

post '/products/:id' do
  Product.new(params).update
  redirect to '/products/products'
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products/products'
end

get '/stock_supply' do
  @stock_supply = Stock_supply.all
  erb (:"stock_supply/stock_supply")
end

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
  redirect to '/wholesalers/wholesalers'
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
  redirect to '/wholesalers/wholesalers'
end

post '/wholesalers/:id/delete' do
  wholesaler = Wholesaler.find( params[:id] )
  wholesaler.delete()
  redirect to '/wholesalers/wholesalers'
end
