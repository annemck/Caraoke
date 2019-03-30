require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../front_desk.rb')
require_relative('../drink.rb')
require('pry')


class TestRoom < MiniTest::Test
  
  def setup
    @song1 = Song.new("Last Friday Night", "Katy Perry")
    @song2 = Song.new("Shake It Off", "Taylor Swift")
    @playlist = [@song1, @song2]
    
    @room = Room.new(@playlist, 3, 20)
    
    @guest = Guest.new("Joe", 30, @song1)
    
    @drink = Drink.new("Beer", 3)
    
    @caraoke = FrontDesk.new(100, @drink)
  end
  
  def test_room_has_playlist
    song_title = @room.playlist[0].title
    song_artist = @room.playlist[1].artist
    assert_equal("Last Friday Night", song_title)
    assert_equal("Taylor Swift", song_artist)
  end
  
  def test_room_has_max_number_of_guests
    assert_equal(3, @room.max_guests)
  end
  
  def test_room_has_cost
    assert_equal(20, @room.room_cost)
  end
  
  def test_if_room_full
    3.times {@caraoke.guest_check_in(@guest, @room)}
    assert_equal(true, @room.room_full)
  end
  
  def test_room_not_full
    @caraoke.guest_check_in(@guest, @room)
    assert_equal(false, @room.room_full)
  end

  def test_guest_list_populating
    @caraoke.guest_check_in(@guest, @room)
    assert_equal("Joe", @room.list_of_guests[0])
  end

end
