require 'date'
require_relative 'room'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room, :cost

    def initialize(check_in, check_out, room)
      @check_in = check_in
      @check_out = check_out
      @room = room
      @cost = cost
    end

  end # end of Reservation class
end # end of Hotel module
