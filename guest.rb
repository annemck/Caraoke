class Guest
  
  attr_reader :name
  attr_accessor :money
  
  def initialize(name, money)
    @name = name
    @money = money
  end
  
  def choose_caraoke_room(guest, room_name)
    room_name.guest_check_in(guest)
  end
  
  def leave_caraoke(guest, room_name)
    room_name.guest_check_out(guest)
  end
  
end
