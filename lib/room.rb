
module Hotel
  class Room
    attr_reader :room_num, :rate

    def initialize(number, rate)
      @room_num = hotel_room(number)
      @rate = rate
    end

    def hotel_room(number)
      unless (1..20).include? number
        raise ArgumentError.new("Invalid room number #{number}")
      end
      @room_num = number
    end

  end # end of Room class
end # end of Hotel module
