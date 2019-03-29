require('pry')
class Room
  
  attr_reader :max_guests, :playlist, :list_of_guests, :room_cost
  
  def initialize(playlist, max_guests, room_cost)
    @playlist = playlist
    @max_guests = max_guests
    @list_of_guests = []
    @room_cost = room_cost
  end
  
  def guest_check_in(guest)
    if room_full == false
      @list_of_guests << guest.name
      charge_guest(guest)
    else
      return "Room full. Please choose another room."
    end
  end
  
  def guest_check_out(guest)
    @list_of_guests.delete(guest.name)
  end
  
  def add_song_to_playlist(song)
    @playlist << song
  end
  
  def room_full
    @list_of_guests.count == @max_guests
  end
  
  def charge_guest(guest)
    guest.money -= @room_cost
  end
  
end
