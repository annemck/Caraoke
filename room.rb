class Room
  
  attr_reader :max_guests, :playlist, :number_of_guests, :room_cost
  
  def initialize(playlist, max_guests, room_cost)
    @playlist = playlist
    @max_guests = max_guests
    @number_of_guests = []
    @room_cost = room_cost
  end
  
  def guest_check_in(guest)
    @number_of_guests << guest.name
  end
  
  def guest_check_out(guest)
    @number_of_guests.delete(guest.name)
  end
  
  def add_song_to_playlist(song)
    @playlist << song
  end
  
end
