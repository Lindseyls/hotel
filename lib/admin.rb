require_relative 'reservation'

module Hotel
  class Admin
    attr_reader :rooms, :reservations, :room_rate

    def initialize
      @rooms = (1..20).to_a
      @room_rate = 200
      @reservations = []
    end

    def add_reservation(room, check_in, check_out)

      # Check that the room exists
      unless @rooms.include? room
        raise ArgumentError.new("Invalid room number: #{room}")
      end

      # Check that the room is available
      unless available_rooms(check_in, check_out).include? room
        raise ArgumentError.new("Room #{room} already has a reservation between #{check_in} and #{check_out}")
      end

      reservation = Reservation.new(check_in, check_out, room, @room_rate)
      @reservations << reservation

      return reservation
    end

    def list_reservations(date)

      reserved_list = []

      @reservations.each do |reservation|
        if reservation.check_in <= date && reservation.check_out >= date
          reserved_list << reservation
        end
      end

      return reserved_list

    end

    def available_rooms(check_in, check_out)

      DateRange.new(check_in, check_out)

      available_list = []

      (check_in...check_out).each do |date|
        available_list << empty_rooms(date)
      end

      available_rooms = available_list[0]
      (available_list.length - 1).times do |i|
        available_rooms = available_rooms & available_list[i + 1]
      end

      return available_rooms

    end

    private

    # check to see if the given date input has any avilable empty rooms
    def empty_rooms(date)
      reservation_list = list_reservations(date)
      reserved_rooms = []

      reservation_list.each do |reservation|
        reserved_rooms << reservation.room
      end
      return @rooms - reserved_rooms
    end

  end # end of Admin class
end # end of Hotel module
