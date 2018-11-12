require_relative('../db/sql_runner')

class Supplier

attr_reader :id

attr_accessor :supplier_name, :supplies_type, :contact_name, :email, :phone

  def initialize( options )
    @id = options['id'].to_i
    @supplier_name = options['supplier_name']
    @supplies_type = options['supplies_type']
    @contact_name = options['contact_name']
    @email = options['email']
    @phone = options['phone']
  end

  def save()
    sql = "INSERT INTO suppliers
    (supplier_name, supplies_type, contact_name, email, phone)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@supplier_name, @supplies_type, @contact_name, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |supplier| Supplier.new( supplier ) }
  end

  def delete()
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [id]
    supplier = SqlRunner.run( sql, values )
    result = Supplier.new( supplier.first )
    return result
  end

  def update
    sql = "UPDATE suppliers SET (supplier_name, supplies_type, contact_name, email, phone) =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@supplier_name, @supplies_type, @contact_name, @email, @phone, @id]
    SqlRunner.run(sql, values)
  end





end
