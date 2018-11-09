require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/product.rb' )
require_relative( './models/manufacturer.rb' )
also_reload( './models/*' )


get '/' do
  erb(:index)
end

get '/products' do
  @products = Product.all
  erb( :"products" )
end

get '/products/add_new' do # new
  erb( :"add_new" )
end

post '/products' do # create
  @product = Product.new( params )
  @product.save()
  redirect to '/products'
end
