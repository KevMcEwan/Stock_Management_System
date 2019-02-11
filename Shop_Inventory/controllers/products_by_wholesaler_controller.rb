require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/product.rb' )
require_relative( '../models/wholesaler.rb' )
require_relative( '../models/stock_supply.rb')
also_reload( '../models/*' )


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

get '/stock_supply/:id/edit_stock_supply' do
  @stock_supply = Stock_supply.find( params[:id] )
  erb( :"stock_supply/edit_stock_supply" )
end

post '/stock_supply/:id' do
  Stock_supply.new(params).update
  redirect to '/stock_supply'
end

post '/stock_supply/:id/delete' do
  stock_supply = Stock_supply.find( params[:id] )
  stock_supply.delete()
  redirect to '/stock_supply'
end
