class FrontDesk
  
  attr_accessor :till
  
  def initialize(till)
    @till = till
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
