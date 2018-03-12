require 'date'

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

      available_rooms = available_rooms(check_in, check_out)
      if available_rooms.empty?
        raise Exception.new("Sorry for the inconvenience. No rooms are available for the date range")
      end

      reservation = Hotel::Reservation.new(check_in, check_out, available_rooms.sample)
      @reservations << reservation

      return reservation

    end


    def list_reservations(date)

      date_check(date)

      reserved_list = []

      @reservations.each do |reservation|
        if reservation.check_in <= date && reservation.check_out >= date
          reserved_list << reservation
        end
      end

      return reserved_list

    end

    def available_rooms(check_in, check_out)

      date_check(check_in)
      date_check(check_out)
      date_range_check(check_in, check_out)

      available_list = []

      (check_in...check_out).to_a.each do |date|
        available_list << empty_rooms(date)
      end

      available_rooms = available_list[0]
      (available_list.length - 1).times do |i|
        available_rooms = available_rooms & available_list[i + 1]
      end

      return available_rooms

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
      if date.class == String
        date = Date.parse(date)
      elsif date.class != Date
        raise ArgumentError.new("Invalid date: #{date}. Please enter date in the form of '2018, 03, 10'")
      end
      return date
    end

    # check to see if the date range is invalid
    def date_range_check(check_in, check_out)
      if check_in >= check_out
        raise ArgumentError.new("Invalid check_out date: #{check_out} must be later than #{check_in}")
      end
    end

    # check to see if the given date input has any avilable empty rooms
    def empty_rooms(date)
      date_check(date)

      reservation_list = list_reservations(date)
      reserved_rooms = []

      reservation_list.each do |reservation|
        reserved_rooms << reservation.room
      end
      return @rooms - reserved_rooms
    end

  end # end of Admin class
end # end of Hotel module
