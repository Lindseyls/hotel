require 'date'
require_relative 'room'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room, :total_cost

    def initialize(check_in, check_out, room)

      date_range_check(check_in, check_out)

      @check_in = date_check(check_in)
      @check_out = date_check(check_out)
      @room = room
      @total_cost = calculate_total_cost
    end

    private

    # check to see if the date range is invalid
    def date_range_check(check_in, check_out)
      if check_in >= check_out
        raise ArgumentError.new("Invalid check_out date: #{check_out} must be later than #{check_in}")
      end
    end

    # check to see if the check_in and check_out dates are invalid
    def date_check(date)
      if date.class == String
        date = Date.parse(date)
      elsif date.class != Date
        raise ArgumentError.new("Invalid date: #{date}. Please enter date in the form of '2018, 03, 10'")
      end
      return date
    end

    # helper method to calculate the total cost of the reservation
    def calculate_total_cost
      ((check_out - check_in) * @room.rate).to_i
    end

  end # end of Reservation class
end # end of Hotel module
