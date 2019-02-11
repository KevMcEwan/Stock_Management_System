require("minitest/autorun")
require_relative("../product")

class TestProduct < MiniTest::Test

  def setup
   options = {"id" => 1, "name" => "Baked Beans", "description" => "420g",
   "quantity" => "1", "supply_cost" =>  "0.20", "customer_price" => "0.30", "product_type" => "tinned foods", "desired_quantity" => "15"}

   @product = Product.new(options)
  end

  def test_name
    expected = "Baked Beans"
    actual = @product.name
    assert_equal(expected, actual)
  end

  def test_description
    expected = "420g"
    actual = @product.description
    assert_equal(expected, actual)
  end

  def test_quantity
    expected = 1
    actual = @product.quantity
    assert_equal(expected, actual)
  end

  def test_supply_cost
    expected = 0.20
    actual = @product.supply_cost.round(2)
    assert_equal(expected, actual)
  end

  def test_customer_price
    expected = 0.30
    actual = @product.customer_price
    assert_equal(expected, actual)
  end

  def test_product_type
    expected = "tinned foods"
    actual = @product.product_type
    assert_equal(expected, actual)
  end

  def test_desired_stock
    expected = 15
    actual = @product.desired_quantity
    assert_equal(expected, actual)
  end

  def test_profit_margin
    expected = 0.5
    actual = @product.profit_margin
    assert_equal(expected, actual)
  end

  def test_low_stock
    expected = "Low stock"
    actual = @product.low_stock
    assert_equal(expected, actual)
  end




end
