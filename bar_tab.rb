class BarTab
  
  attr_reader :guest, :room
  attr_accessor :tab_total
  
  def initialize(guest, room)
    @guest = guest
    @room = room
    @tab_total = 0
  end
  
end
