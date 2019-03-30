require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../front_desk')



class TestDrink < MiniTest::Test
  
  def setup
    @drink = Drink.new("Beer", 3)
  end
  
  def test_drink_has_name
    assert_equal("Beer", @drink.drink_name)
  end
  
  def test_drink_has_cost
    assert_equal(3, @drink.cost)
  end
  
end
