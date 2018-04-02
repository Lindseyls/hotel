require_relative 'date_range'

module Hotel
  class Reservation < DateRange
    attr_reader :room, :rate

    def initialize(check_in, check_out, room, rate)
      super(check_in, check_out)
      @room = room
      @rate = rate
    end

    def total_cost
      return nights * @rate
    end

  end # end of Reservation class
end # end of Hotel module
