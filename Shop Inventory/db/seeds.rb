require_relative( "../models/supplier.rb" )
require_relative( "../models/product.rb" )
require("pry-byebug")

Product.delete_all()
Supplier.delete_all()


product1 = Product.new({
  "name" => "Baked Beans", "description" => "420g tin",
  "quantity" => "1", "supply_cost" =>  "0.20", "customer_price" => "0.30", "product_type" => "tinned foods", "desired_quantity" => "15"})
product1.save()

product2 = Product.new({
  "name" => "Toilet roll", "description" => "4 pack",
  "quantity" => "10", "supply_cost" =>  "2.00", "customer_price" => "3.00", "product_type" => "bathroom", "desired_quantity" => "10"})
product2.save()

product3 = Product.new({
  "name" => "Whisky", "description" => "Famous Grouse",
  "quantity" => "3", "supply_cost" =>  "9.00", "customer_price" => "12.00", "product_type" => "alcohol", "desired_quantity" => "4"})
product3.save()



supplier1 = Supplier.new({
  "supplier_name" => "Heinz", "supplies_type" => "Processed foods", "contact_name" => "James Red", "email" => "james@co.heinz", "phone" => "0207 345 678"
  })
supplier1.save

supplier2 = Supplier.new({
  "supplier_name" => "Andrex", "supplies_type" => "Bathroom products", "contact_name" => "Chloe White", "email" => "chloe@co.andrex", "phone" => "0345 987 654"
  })
supplier2.save

supplier3 = Supplier.new({
  "supplier_name" => "Edrington Group", "supplies_type" => "Alcoholic beverages", "contact_name" => "John E. Walker", "email" => "john@co.edrington", "phone" => "0141 123 321"
  })
supplier3.save


product4 = Product.new({
  "name" => "Test", "description" => "Famous Grouse",
  "quantity" => "3", "supply_cost" =>  "9.00", "customer_price" => "8.00", "product_type" => "alcohol", "desired_quantity" => "4"})
product4.save()

supplier1.supplier_name = "Heinz 2"
supplier1.update
