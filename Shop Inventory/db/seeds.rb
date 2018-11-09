require_relative( "../models/manufacturer.rb" )
require_relative( "../models/product.rb" )
require("pry-byebug")

Product.delete_all()
Manufacturer.delete_all()


product1 = Product.new({
  "name" => "Baked Beans", "description" => "420g tin",
  "quantity" => "1", "buying_cost" =>  "0.20", "customer_price" => "0.30", "product_type" => "tinned foods", "desired_quantity" => "15"})
product1.save()

product2 = Product.new({
  "name" => "Toilet roll", "description" => "4 pack",
  "quantity" => "10", "buying_cost" =>  "2.00", "customer_price" => "3.00", "product_type" => "bathroom", "desired_quantity" => "10"})
product2.save()

product3 = Product.new({
  "name" => "Whisky", "description" => "Famous Grouse",
  "quantity" => "3", "buying_cost" =>  "9.00", "customer_price" => "12.00", "product_type" => "alcohol", "desired_quantity" => "4"})
product3.save()



manufacturer1 = Manufacturer.new({
  "name" => "Heinz", "supplies_type" => "Processed foods"
  })
manufacturer1.save

manufacturer2 = Manufacturer.new({
  "name" => "Andrex", "supplies_type" => "Bathroom products"
  })
manufacturer2.save

manufacturer3 = Manufacturer.new({
  "name" => "Edrington Group", "supplies_type" => "Alcoholic beverages"
  })
manufacturer3.save

p Product.all
