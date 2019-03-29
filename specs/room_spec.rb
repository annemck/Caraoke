require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')


class TestRoom < MiniTest::Test
  
  def setup
    @song1 = Song.new("Last Friday Night", "Katy Perry")
    @song2 = Song.new("Shake It Off", "Taylor Swift")
    @playlist = [@song1, @song2]
    
    @room = Room.new(@playlist, 5)
    
    @guest = Guest.new("Joe")
    @guest2 = Guest.new("Mary")
  end
  
  def test_room_has_playlist
    song_title = @room.playlist[0].title
    song_artist = @room.playlist[1].artist
    assert_equal("Last Friday Night", song_title)
    assert_equal("Taylor Swift", song_artist)
  end
  
  def test_room_has_max_number_of_guests
    assert_equal(5, @room.max_guests)
  end
  
  def test_guest_can_check_in
    @room.guest_check_in(@guest)
    assert_equal("Joe", @room.number_of_guests[0])
  end
  
  def test_guest_can_check_out
    @room.guest_check_in(@guest)
    @room.guest_check_in(@guest2)
    assert_equal("Joe", @room.number_of_guests[0])
    @room.guest_check_out(@guest)
    assert_equal(["Mary"], @room.number_of_guests)
  end
  
  def test_song_can_be_added_to_room
    @song3 = Song.new("Hurts", "Johnny Cash")
    @room.add_song_to_playlist(@song3)
    assert_equal("Johnny Cash", @playlist[2].artist)
  end
  
end
