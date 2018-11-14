require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
# require_relative( './models/product.rb' )
require_relative( '../models/wholesaler.rb' )
# require_relative( './models/stock_supply.rb')
also_reload( '../models/*' )



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
