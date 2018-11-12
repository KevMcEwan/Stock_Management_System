require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/product.rb' )
require_relative( './models/supplier.rb' )
also_reload( './models/*' )


get '/' do
  erb(:index)
end

get '/products' do
  @products = Product.all
  erb( :products)
end

get '/products/stock_order' do
  @products = Product.stock_order
  erb( :stock_order)
end

get '/products/profit_margin' do
  @products = Product.all
  erb( :profit_margin)
end

get '/products/add_new' do
  erb( :"add_new" )
end

get '/products/:id' do
  @product = Product.find( params[:id] )
  erb( :"/productinfo" )
end

post '/products' do
  @product = Product.new( params )
  @product.save
  redirect to '/products'
end

get '/products/:id/edit' do
  @product = Product.find( params[:id] )
  erb( :edit )
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



get '/suppliers' do
  @suppliers = Supplier.all
  erb (:suppliers)
end

get '/suppliers/add_new' do
  erb( :"add_new" )
end

post '/suppliers' do
  @supplier = Supplier.new( params )
  @supplier.save
  redirect to '/suppliers'
end

get '/suppliers/:id' do
  @supplier = Supplier.find( params[:id] )
  erb( :"/supplierinfo" )
end


get '/suppliers/:id/edit' do
  @supplier = Supplier.find( params[:id] )
  erb( :edit )
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect to '/suppliers'
end

post '/suppliers/:id/delete' do
  supplier = Supplier.find( params[:id] )
  supplier.delete()
  redirect to '/suppliers'
end
