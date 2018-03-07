
module Hotel
  class Room
    attr_reader :room_num, :cost, :status

    ROOM_NUMBER = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    ROOM_COST = 200.00

    def initialize(room_num)

      unless ROOM_NUMBER.include? room_num
        raise ArgumentError.new("Invalid room number #{room_num}")
      end

      @room_num = room_num
      @cost = ROOM_COST


      # @status = input[:status] == nil ? :AVAILABLE : input[:status]
    end

    # def add_reservation(reservation)
    #   @reservation << reservation
    # end

  end # end of Room class
end # end of Hotel module
