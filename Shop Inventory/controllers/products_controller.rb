require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
# require_relative( './models/wholesaler.rb' )
# require_relative( './models/stock_supply.rb')
also_reload( '../models/*' )


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
