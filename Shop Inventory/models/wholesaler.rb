require_relative('../db/sql_runner')

class Wholesaler

attr_reader :id

attr_accessor :wholesaler_name, :contact_name, :email, :phone

  def initialize( options )
    @id = options['id'].to_i
    @wholesaler_name = options['wholesaler_name']
    @contact_name = options['contact_name']
    @email = options['email']
    @phone = options['phone']
  end

  def save()
    sql = "INSERT INTO wholesalers
    (wholesaler_name, contact_name, email, phone)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@wholesaler_name, @contact_name, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM wholesalers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM wholesalers"
    results = SqlRunner.run( sql )
    return results.map { |wholesaler| Wholesaler.new( wholesaler ) }
  end

  def delete()
    sql = "DELETE FROM wholesalers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM wholesalers
    WHERE id = $1"
    values = [id]
    wholesaler = SqlRunner.run( sql, values )
    result = Wholesaler.new( wholesaler.first )
    return result
  end

  def update
    sql = "UPDATE wholesalers SET (wholesaler_name, contact_name, email, phone) =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@wholesaler_name, @contact_name, @email, @phone, @id]
    SqlRunner.run(sql, values)
  end

  def product
    sql = "SELECT products.* FROM products INNER JOIN stock_supply ON product_id WHERE wholesaler_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |product| Product.new(product) }
  end

  def products_stocked
    sql = "SELECT products.*
    FROM products
    INNER JOIN stock_supply
    ON stock_supply.product_id = products.id
    WHERE stock_supply.wholesaler_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |product| Product.new(product) }
  end





end
