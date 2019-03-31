require('pry')
class Guest
  
  attr_reader :name, :fav_song
  attr_accessor :money, :running_tab 
  
  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
    @running_tab = 0
  end
  
  def choose_caraoke_room(guest, bar, room_name)
    bar.guest_check_in(guest, room_name)
  end
  
  def leave_caraoke(guest, bar, room_name)
    bar.guest_check_out(guest, room_name)
  end
  
  def fav_song_on_playlist(room_name)
    return "Woohoo!" if room_name.playlist.include?(@fav_song)
  end
  
  def order_drink(drink, room)
    if room.drink_menu.include?(drink)
      @running_tab += drink.cost
    end
  end
  
end
