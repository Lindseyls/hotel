require 'pry'

module Hotel
  class Room
    attr_reader :room_num, :cost, :reservation

    ROOM_NUMBER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    ROOM_COST = 200.00

    def initialize(number)
      @room_num = hotel_room(number)
      @cost = ROOM_COST
      # @reservation = reservation
    end

    def hotel_room(number)
      unless ROOM_NUMBER.include? number
        raise ArgumentError.new("Invalid room number #{number}")
      end
      @room_num = number
    end

    # def add_reservation(reservation)
    #   @reservation << reservation
    # end

  end # end of Room class
end # end of Hotel module
