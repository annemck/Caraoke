require('minitest/autorun')
require('minitest/rg')
require_relative('../bar_tab.rb')
require_relative('../drink.rb')
require_relative('../front_desk.rb')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../room.rb')


class TestBarTab < MiniTest::Test
  
  def setup
    @drink = Drink.new("Beer", 3)
    @caraoke = FrontDesk.new(100, @drink)
    @song = Song.new("Shake It Off", "Taylor Swift")
    @guest = Guest.new("Joe", 30, @song)
    @room = Room.new(@song, 10, 10)
    @guest_tab = BarTab.new(@guest, @room)
  end
  
  def test_bar_tab_starts_0
    assert_equal(0, @guest_tab.tab_total)
  end

  
  
end
