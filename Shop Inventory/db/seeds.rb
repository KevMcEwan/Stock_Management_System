require_relative( "../models/wholesaler.rb" )
require_relative( "../models/product.rb" )
require_relative( "../models/stock_supply.rb")
require("pry-byebug")

Stock_supply.delete_all()
Product.delete_all()
Wholesaler.delete_all()



product1 = Product.new({
  "name" => "Heinz Baked Beans", "description" => "420g tin",
  "quantity" => "1", "supply_cost" =>  "0.20", "customer_price" => "0.30", "product_type" => "tinned foods", "desired_quantity" => "15", "wholesaler" => "Booker"})
product1.save()

product2 = Product.new({
  "name" => "Andrex Toilet roll", "description" => "4 pack",
  "quantity" => "10", "supply_cost" =>  "2.00", "customer_price" => "3.00", "product_type" => "bathroom", "desired_quantity" => "10", "wholesaler" => "Makro"})
product2.save()

product3 = Product.new({
  "name" => "Famous Grouse", "description" => "70 cl bottle",
  "quantity" => "3", "supply_cost" =>  "9.00", "customer_price" => "12.00", "product_type" => "alcohol", "desired_quantity" => "4", "wholesaler" => "Costco"})
product3.save()

product4 = Product.new({
  "name" => "Coca Cola", "description" => "330ml can",
  "quantity" => "10", "supply_cost" =>  "0.30", "customer_price" => "0.60", "product_type" => "grocery", "desired_quantity" => "24", "wholesaler" => "Makro"})
product4.save()

product5 = Product.new({
  "name" => "Coca Cola", "description" => "330ml can",
  "quantity" => "10", "supply_cost" =>  "0.35", "customer_price" => "0.60", "product_type" => "grocery", "desired_quantity" => "24", "wholesaler" => "Costco"})
product5.save()



wholesaler1 = Wholesaler.new({
  "wholesaler_name" => "Booker", "supplies_type" => "Processed foods", "contact_name" => "James Red", "email" => "james@co.heinz", "phone" => "0207 345 678"
  })
wholesaler1.save

wholesaler2 = Wholesaler.new({
  "wholesaler_name" => "Makro", "supplies_type" => "Bathroom products", "contact_name" => "Chloe White", "email" => "chloe@co.andrex", "phone" => "0345 987 654"
  })
wholesaler2.save

wholesaler3 = Wholesaler.new({
  "wholesaler_name" => "Costco", "supplies_type" => "Alcoholic beverages", "contact_name" => "John E. Walker", "email" => "john@co.edrington", "phone" => "0141 123 321"
  })
wholesaler3.save


stock_supply1 = Stock_supply.new({"product_id" => product1.id, "wholesaler_id" => wholesaler1.id, "supply_price" => "0.20"})
stock_supply1.save

stock_supply2 = Stock_supply.new({"product_id" => product1.id, "wholesaler_id" => wholesaler2.id, "supply_price" => "0.18"})
stock_supply2.save

stock_supply3 = Stock_supply.new({"product_id" => product1.id, "wholesaler_id" => wholesaler3.id, "supply_price" => "0.22"})
stock_supply3.save
