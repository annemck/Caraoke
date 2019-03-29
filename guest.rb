class Guest
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def choose_caraoke_room(guest, room_name)
    room_name.guest_check_in(guest)
  end
  
end
