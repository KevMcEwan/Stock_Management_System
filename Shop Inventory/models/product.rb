require_relative('../db/sql_runner')

class Product

  attr_reader :id

  attr_accessor :name, :description, :quantity, :supply_cost, :customer_price, :product_type, :desired_quantity

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_f
    @supply_cost = options['supply_cost'].to_f
    @customer_price = options['customer_price'].to_f
    @product_type = options['product_type']
    @desired_quantity = options['desired_quantity'].to_f
  end



  def low_stock
    result = @quantity.to_f/@desired_quantity.to_f
    if result.round(2) < 0.10 
    else
      return "Quantity acceptable"
    end
  end

  def save()
    if @customer_price > @supply_cost
      sql = "INSERT INTO products
      (name, description, quantity, supply_cost, customer_price, product_type, desired_quantity)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id"
      values = [@name, @description, @quantity, @supply_cost, @customer_price, @product_type, @desired_quantity]
      results = SqlRunner.run(sql, values)
      @id = results.first['id'].to_i
    else
      p "Cannot sell for less than supply cost"
    end
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |product| Product.new( product ) }
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    product = SqlRunner.run( sql, values )
    result = Product.new( product.first )
    return result
  end

  def update
    # if @customer_price > @supply_cost
      sql = "UPDATE products SET (name, description, quantity, supply_cost, customer_price, product_type, desired_quantity) =
      ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
      values = [@name, @description, @quantity, @supply_cost, @customer_price, @product_type, @desired_quantity, @id]
      SqlRunner.run(sql, values)
    # else
    #   p "Cannot sell for less than supply cost"
    # end
  end


  def self.stock_order
    sql = "SELECT * FROM products WHERE (quantity/desired_quantity) < 0.2"
    results = SqlRunner.run(sql)
    return results.map { |product| Product.new(product)}
  end

  def profit_margin
    result = ((@customer_price/@supply_cost)-1).round(2)
  end

  def update_customer_price(profit_margin)
    result = ((profit_margin/100) +1)*@supply_cost
    @customer_price = result
    sql = "UPDATE products SET (name, description, quantity, supply_cost, customer_price, product_type, desired_quantity) =
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@name, @description, @quantity, @supply_cost, @customer_price, @product_type, @desired_quantity, @id]
    SqlRunner.run(sql, values)
  end



end
