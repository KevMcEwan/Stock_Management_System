require_relative('../db/sql_runner')

class Manufacturer

attr_reader :name, :supplies_type

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @supplies_type = options['supplies_type']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (name, supplies_type)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @supplies_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run( sql )
    return results.map { |manufacturer| Manufacturer.new( manufacturer ) }
  end

  def delete()
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    manufacturer = SqlRunner.run( sql, values )
    result = Manufacturer.new( manufacturer.first )
    return result
  end

  def update
    sql = "UPDATE manufacturers SET (name, supplies_type)
    VALUES
    ($1, $2)
    WHERE id = $3"
    values = [@name, @supplies_type, @id]
    SqlRunner.run(sql, values)
  end





end
