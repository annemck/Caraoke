require('pry')
class Room
  
  attr_reader :max_guests, :playlist, :list_of_guests, :room_cost, :drink_menu
  attr_accessor :guests_running_tab
  
  def initialize(playlist, max_guests, room_cost)
    @playlist = playlist
    @max_guests = max_guests
    @list_of_guests = []
    @room_cost = room_cost
    @drink_menu = []
  end
  
  def room_full
    @list_of_guests.count == @max_guests
  end
  
end
