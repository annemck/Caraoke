require('pry')
class Room
  
  attr_reader :max_guests, :playlist, :list_of_guests, :room_cost
  
  def initialize(playlist, max_guests, room_cost)
    @playlist = playlist
    @max_guests = max_guests
    @list_of_guests = []
    @room_cost = room_cost
  end
  
  def add_song_to_playlist(song)
    @playlist << song
  end
  
  def room_full
    @list_of_guests.count == @max_guests
  end
  
end
