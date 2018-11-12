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



get '/suppliers' do
  @suppliers = Supplier.all
  erb (:"suppliers/suppliers")
end

get '/suppliers/add_new_supplier' do
  erb( :"suppliers/add_new_supplier" )
end

post '/suppliers' do
  @supplier = Supplier.new( params )
  @supplier.save
  redirect to '/suppliers/suppliers'
end

get '/suppliers/:id' do
  @supplier = Supplier.find( params[:id] )
  erb( :"/suppliers/supplier_info" )
end

get '/suppliers/:id/editsupplier' do
  @supplier = Supplier.find( params[:id] )
  erb( :"suppliers/editsupplier" )
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect to '/suppliers/suppliers'
end

post '/suppliers/:id/delete' do
  supplier = Supplier.find( params[:id] )
  supplier.delete()
  redirect to '/suppliers/suppliers'
end
