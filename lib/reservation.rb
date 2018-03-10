require 'date'
require_relative 'room'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room, :total_cost

    def initialize(check_in, check_out, room)

      # raises ArgumentError if the check_in date is before the check_out date
      if check_in >= check_out
        raise ArgumentError.new("Invalid check_out date: #{check_out} must be later than #{check_in}")
      end

      @check_in = check_in
      @check_out = check_out
      @room = room
      @total_cost = ((check_out - check_in) * @room.rate).to_i
    end

  end # end of Reservation class
end # end of Hotel module
