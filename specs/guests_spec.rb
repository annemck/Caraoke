require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')


class TestGuest < MiniTest::Test
  
  def setup
    @guest = Guest.new("Joe")
    @song = Song.new("Hurts", "Johny Cash")
    @room = Room.new(@song, 5)
  end
  
  def test_guest_has_name
    assert_equal("Joe", @guest.name)
  end
  
  def test_guest_can_choose_room
    @guest.choose_caraoke_room(@guest, @room)
    assert_equal(1, @room.number_of_guests)
  end
  
end
