class Room
  
  attr_reader :max_guests, :playlist
  attr_accessor :number_of_guests
  
  def initialize(playlist, max_guests)
    @playlist = playlist
    @max_guests = max_guests
    @number_of_guests = []
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
