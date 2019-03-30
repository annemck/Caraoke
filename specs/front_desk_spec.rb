require('minitest/autorun')
require('minitest/rg')
require_relative('../front_desk.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class TestFrontDesk < MiniTest::Test
  
  def setup
    @song = Song.new("Last Friday Night", "Katy Perry")
    @guest = Guest.new("Joe", 30, @song)
    @guest2 = Guest.new("Mary", 25, @song)
    @room = Room.new(@song, 3, 20)
    @caraoke = FrontDesk.new(100)
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
    assert_equal("Joe", @room.list_of_guests[0])
    @caraoke.guest_check_out(@guest, @room)
    assert_equal(["Mary"], @room.list_of_guests)
  end
  
  def test_guest_charged
    @caraoke.charge_guest(@guest, @room)
    assert_equal(10, @guest.money)
  end
  
  def test_guest_asked_for_new_room_if_full
    @caraoke.guest_check_in(@guest, @room)
    @caraoke.guest_check_in(@guest, @room)
    @caraoke.guest_check_in(@guest, @room)
    assert_equal("Room full. Please choose another room.", @caraoke.guest_check_in(@guest, @room))
  end
  
end
