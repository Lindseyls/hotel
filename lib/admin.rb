require 'date'
require 'pry'
require 'awesome_print'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Admin
    attr_reader :rooms, :reservations

    def initialize
      @rooms = list_of_rooms
      @reservations = []
    end

    def add_reservation(check_in, check_out)

      date_check(check_in)
      date_check(check_out)
      date_range_check(check_in, check_out)

      reservation = Hotel::Reservation.new(check_in, check_out, rooms.sample)
      @reservations << reservation
      # binding.pry

      return reservation

    end


    def list_reservations(date)

      date_check(date)




    end


    private

    # .each loop to iterate and create a list of all 20 rooms
    def list_of_rooms
      rooms = []
      (1..20).to_a.each do |num|
        rooms << Hotel::Room.new(num, 200)
      end
      return rooms
    end

    # check to see if the check_in and check_out dates are invalid
    def date_check(date)
      if date.class != Date
        raise ArgumentError.new("Invalid date: #{date}")
      end
    end

    # check to see if the date range is invalid
    def date_range_check(check_in, check_out)
      if check_in >= check_out
        raise ArgumentError.new("Invalid check_out date: #{check_out} must be later than #{check_in}")
      end
    end

  end # end of Admin class
end # end of Hotel module
