require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/product.rb' )
require_relative( './models/supplier.rb' )
also_reload( './models/*' )


get '/' do
  redirect to 'products'
end

get '/products' do
  @products = Product.all
  erb( :index )
end

get '/products/stock_order' do
  @products = Product.stock_order
  erb( :stock_order)
end

get '/suppliers' do
  @suppliers = Supplier.all
  erb (:suppliers)
end


get '/products/add_new' do
  erb( :"add_new" )
end

post '/products' do
  @product = Product.new( params )
  @product.save
  redirect to '/products'
end

get '/products/:id' do
  @product = Product.find( params[:id] )
  erb( :"/productinfo" )
end


get '/products/:id/edit' do
  @product = Product.find( params[:id] )
  erb( :edit )
end

post '/products/:id' do
  Product.find(params).update
  redirect to '/products'
end

post '/products/:id/delete' do
  product = Product.find( params[:id] )
  product.delete()
  redirect to '/products'
end
