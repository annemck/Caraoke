class FrontDesk
  
  attr_accessor :till, :drink_selection
  
  def initialize(till, drink_selection)
    @till = till
    @drink_selection = drink_selection
  end
  
  def add_song_to_playlist(room_name, song)
    room_name.playlist << song
  end
  
  def guest_check_in(guest, room_name)
    if room_name.room_full == false
      room_name.list_of_guests << guest.name
    else
      return "Room full. Please choose another room."
    end
  end
  
  def guest_check_out(guest, room_name)
    room_name.list_of_guests.delete(guest.name)
    charge_guest(guest, room_name)
  end
  
  def charge_guest(guest, room_name)
    guest.money -= room_name.room_cost
  end
  
end
