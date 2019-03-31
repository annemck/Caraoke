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
    charge_guest_for_drinks(guest)
  end
  
  def charge_guest(guest, room_name)
    guest.money -= room_name.room_cost
    @till += room_name.room_cost
  end
  
  def add_drink_to_room_menu(drink, room_name)
    room_name.drink_menu << drink
  end
  
  def add_drink_to_selection(drink)
    @drink_selection << drink
  end
  
  def charge_guest_for_drinks(guest)
    guest.money -= guest.running_tab
    @till += guest.running_tab
    guest.running_tab = 0
  end
  
  
  
end
