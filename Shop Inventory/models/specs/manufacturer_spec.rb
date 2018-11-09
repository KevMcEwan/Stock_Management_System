require("minitest/autorun")
require_relative("../manufacturer")

class TestManufacturer < MiniTest::Test

  def setup
   options = {"id" => 1, "name" => "Heinz", "supplies_type" => "Processed food"}

   @manufacturer = Manufacturer.new(options)
  end

  def test_name
    expected = "Heinz"
    actual = @manufacturer.name
    assert_equal(expected, actual)
  end

  def test_supplies_type
    expected = "Processed food"
    actual = @manufacturer.supplies_type
    assert_equal(expected, actual)
  end



end
