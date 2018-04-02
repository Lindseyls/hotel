
module Hotel
  class Room
    attr_reader :room, :rate

    def initialize(room, rate)
      @room = hotel_room(room)
      @rate = rate
    end

    # raises ArgumentError if the room number is not between 1 and 20
    def hotel_room(room)
      unless (1..20).include? room
        raise ArgumentError.new("Invalid room number: #{room}")
      end
      @room = room
    end

  end # end of Room class
end # end of Hotel module
