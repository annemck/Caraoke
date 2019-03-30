require('pry')
class Guest
  
  attr_reader :name, :fav_song
  attr_accessor :money
  
  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end
  
  def choose_caraoke_room(guest, room_name)
    room_name.guest_check_in(guest)
  end
  
  def leave_caraoke(guest, room_name)
    room_name.guest_check_out(guest)
  end
  
  def fav_song_on_playlist(room)
    return "Woohoo!" if room.playlist.include?(@fav_song)
  end
  
end
