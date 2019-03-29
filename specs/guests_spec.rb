require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')


class TestGuest < MiniTest::Test
  
  def setup
    @guest = Guest.new("Joe", 30)
    @song = Song.new("Hurts", "Johny Cash")
    @room = Room.new(@song, 5, 20)
  end
  
  def test_guest_has_name
    assert_equal("Joe", @guest.name)
  end
  
  def test_guest_can_choose_room
    @guest.choose_caraoke_room(@guest, @room)
    assert_equal(1, @room.list_of_guests.count)
  end
  
  def test_guest_can_leave
    @guest.choose_caraoke_room(@guest, @room)
    @guest.leave_caraoke(@guest, @room)
    assert_equal(0, @room.list_of_guests.count)
  end
  
  def test_guest_has_money
    assert_equal(30, @guest.money)
  end
  
end
