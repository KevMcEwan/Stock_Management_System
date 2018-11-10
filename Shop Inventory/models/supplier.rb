require_relative('../db/sql_runner')

class Supplier

attr_reader :id

attr_accessor :name, :supplies_type

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @supplies_type = options['supplies_type']
  end

  def save()
    sql = "INSERT INTO suppliers
    (name, supplies_type)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @supplies_type]
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
    sql = "UPDATE suppliers SET (name, supplies_type)
    VALUES
    ($1, $2)
    WHERE id = $3"
    values = [@name, @supplies_type, @id]
    SqlRunner.run(sql, values)
  end





end
