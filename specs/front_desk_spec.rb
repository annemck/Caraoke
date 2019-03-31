require('minitest/autorun')
require('minitest/rg')
require_relative('../front_desk.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../drink.rb')
require_relative('../bar_tab.rb')


class TestFrontDesk < MiniTest::Test
  
  def setup
    @song = Song.new("Last Friday Night", "Katy Perry")
    @song2 = Song.new("Shake It Off", "Taylor Swift")
    @playlist = [@song, @song2]
    
    @guest = Guest.new("Joe", 30, @song)
    @guest2 = Guest.new("Mary", 25, @song)
    
    @drink = Drink.new("Beer", 3)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Cider", 3)
    @drink_list = [@drink, @drink2]
    
    @room = Room.new(@playlist, 3, 20)
    @room.drink_menu << @drink
    @room.drink_menu << @drink2
    @caraoke = FrontDesk.new(100, @drink_list)
    
    @tab = BarTab.new(@guest, @room)
  end
  
  def test_desk_has_till
    assert_equal(100, @caraoke.till)
  end
  
  def test_guest_can_check_in
    @caraoke.guest_check_in(@guest, @room)
    assert_equal("Joe", @room.list_of_guests[0])
  end
  
  def test_guest_can_check_out
    @caraoke.guest_check_in(@guest, @room)
    @caraoke.guest_check_in(@guest2, @room)
    @guest.order_drink(@drink, @room, @tab)
    assert_equal("Joe", @room.list_of_guests[0])
    @caraoke.guest_check_out(@guest, @room, @tab)
    assert_equal(["Mary"], @room.list_of_guests)
    assert_equal(123, @caraoke.till)
  end
  
  def test_guest_charged
    @caraoke.charge_guest(@guest, @room)
    assert_equal(10, @guest.money)
    assert_equal(120, @caraoke.till)
  end
  
  def test_guest_asked_for_new_room_if_full
    3.times {@caraoke.guest_check_in(@guest, @room)}
    assert_equal("Room full. Please choose another room.", @caraoke.guest_check_in(@guest, @room))
  end
  
  def test_song_can_be_added_to_room
    @song3 = Song.new("Hurts", "Johnny Cash")
    @caraoke.add_song_to_playlist(@room, @song3)
    assert_equal("Johnny Cash", @playlist[2].artist)
  end
  
  def test_desk_has_drink_selection
    assert_equal("Wine", @caraoke.drink_selection[1].drink_name)
  end
  
  def test_drink_can_be_added_to_menu
    @caraoke.add_drink_to_room_menu(@drink3, @room)
    assert_equal("Cider", @room.drink_menu[2].drink_name)
  end
  
  def test_add_drink_to_drink_selection
    @caraoke.add_drink_to_selection(@drink3)
    assert_equal("Cider", @caraoke.drink_selection[2].drink_name)
  end
  
  def test_guest_charged_for_drinks
    @guest.order_drink(@drink, @room, @tab)
    @caraoke.charge_guest_for_drinks(@guest, @tab)
    assert_equal(103, @caraoke.till)
    assert_equal(27, @guest.money)
    assert_equal(0, @tab.tab_total)
  end
  
end
