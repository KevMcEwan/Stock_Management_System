require("minitest/autorun")
require_relative("../wholesaler")

class TestManufacturer < MiniTest::Test

  def setup
   options = {"id" => 1, "name" => "Heinz", "supplies_type" => "Processed food", "contact_name" => "Mr Heinz", "email" => "@heinz", "phone" => "12345"}

   @wholesaler = wholesaler.new(options)
  end

  def test_name
    expected = "Heinz"
    actual = @wholesaler.name
    assert_equal(expected, actual)
  end

  def test_supplies_type
    expected = "Processed food"
    actual = @wholesaler.supplies_type
    assert_equal(expected, actual)
  end



end
