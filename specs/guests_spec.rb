require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../front_desk.rb')
require('pry')


class TestGuest < MiniTest::Test
  
  def setup
    @song = Song.new("Hurt", "Johny Cash")
    @song2 = Song.new("Shake It Off", "Taylor Swift")
    @playlist = [@song, @song2]
    @guest = Guest.new("Joe", 30, @song)
    @room = Room.new(@playlist, 5, 20)
    @caraoke = FrontDesk.new(100)
  end
  
  def test_guest_has_name
    assert_equal("Joe", @guest.name)
  end
  
  def test_guest_can_choose_room
    @guest.choose_caraoke_room(@guest, @caraoke, @room)
    assert_equal(1, @room.list_of_guests.count)
  end
  
  def test_guest_can_leave
    @guest.choose_caraoke_room(@guest, @caraoke, @room)
    @guest.leave_caraoke(@guest, @caraoke, @room)
    assert_equal(0, @room.list_of_guests.count)
  end
  
  def test_guest_has_money
    assert_equal(30, @guest.money)
  end
  
  def test_guest_has_fav_song
    assert_equal("Hurt", @guest.fav_song.title)
  end
  
  def test_customer_goes_woohoo
    assert_equal("Woohoo!", @guest.fav_song_on_playlist(@room))
  end
  
end
