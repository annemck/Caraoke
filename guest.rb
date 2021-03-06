require('pry')
class Guest
  
  attr_reader :name, :fav_song
  attr_accessor :money
  
  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end
  
  def choose_caraoke_room(guest, bar, room_name)
    bar.guest_check_in(guest, room_name)
  end
  
  def leave_caraoke(guest, bar, room_name, tab_name)
    bar.guest_check_out(guest, room_name, tab_name)
  end
  
  def fav_song_on_playlist(room_name)
    return "Woohoo!" if room_name.playlist.include?(@fav_song)
  end
  
  def order_drink(drink, room, tab_name)
    if room.drink_menu.include?(drink)
      room.amend_tab(drink, tab_name)
    end
  end
  
end
