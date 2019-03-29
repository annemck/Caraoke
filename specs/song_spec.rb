require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class TestSong < MiniTest::Test
  
  def setup
    @song = Song.new("Last Friday Night", "Katy Perry")
  end
  
  def test_song_has_title
    assert_equal("Last Friday Night", @song.title)
  end
  
  def test_song_has_artist
    assert_equal("Katy Perry", @song.artist)
  end
  
end
