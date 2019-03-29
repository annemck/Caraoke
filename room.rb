class Room
  
  attr_reader :playlist, :max_guests
  
  def initialize(playlist, max_guests)
    @playlist = playlist
    @max_guests = max_guests
  end
  
end
