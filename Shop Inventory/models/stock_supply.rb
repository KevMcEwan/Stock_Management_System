require_relative('../db/sql_runner')

class Stock_supply

  attr_reader :id

  attr_accessor :product_id, :wholesaler_id, :supply_price

  def initialize( options )
    @id = options['id'].to_i
    @product_id = options['product_id']
    @wholesaler_id = options['wholesaler_id']
    @supply_price = options['supply_price']
  end

  def save()
    sql = "INSERT INTO stock_supply
    (product_id, wholesaler_id, supply_price)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@product_id, @wholesaler_id, @supply_price]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stock_supply"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM stock_supply"
    results = SqlRunner.run( sql )
    return results.map { |stock_supply| Stock_supply.new( stock_supply ) }
  end

  def delete()
    sql = "DELETE FROM stock_supply WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM stock_supply
    WHERE id = $1"
    values = [id]
    stock_supply = SqlRunner.run( sql, values )
    result = Stock_supply.new( stock_supply.first )
    return result
  end

  def update
    sql = "UPDATE stock_supply SET (product_id, wholesaler_id, supply_price) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@product_id, @wholesaler_id, @supply_price, @id]
    SqlRunner.run(sql, values)
  end

  def product
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [@product_id]
    product = SqlRunner.run(sql, values).first
    return Product.new(product)
  end

  def wholesaler
    sql = "SELECT * FROM wholesalers WHERE id = $1"
    values = [@wholesaler_id]
    wholesaler = SqlRunner.run(sql, values).first
    return Wholesaler.new(wholesaler)
  end

  def customer_price
    sql = "SELECT customer_price FROM products WHERE id = $1"
    values = [@product_id]
    result = SqlRunner.run(sql, values).first
    return Product.new(result).customer_price
  end

  def product_description
    sql = "SELECT description FROM products WHERE id = $1"
    values = [@product_id]
    result = SqlRunner.run(sql, values).first
    return Product.new(result).description
  end

  # def supply_price
  #   sql = "SELECT supply_price FROM  WHERE id = $1"
  #   values = [@product_id]


end
