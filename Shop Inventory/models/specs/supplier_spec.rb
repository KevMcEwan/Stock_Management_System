require("minitest/autorun")
require_relative("../supplier")

class TestManufacturer < MiniTest::Test

  def setup
   options = {"id" => 1, "name" => "Heinz", "supplies_type" => "Processed food", "contact_name" => "Mr Heinz", "email" => "@heinz", "phone" => "12345"}

   @supplier = Supplier.new(options)
  end

  def test_name
    expected = "Heinz"
    actual = @supplier.name
    assert_equal(expected, actual)
  end

  def test_supplies_type
    expected = "Processed food"
    actual = @supplier.supplies_type
    assert_equal(expected, actual)
  end



end
