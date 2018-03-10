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

    # def list_rooms
    #   @rooms
    #   # binding.pry
    # end
    #

    def add_reservation(check_in, check_out)

    end


    def list_reservations(date)

    end


    def total_cost(reservation)

    end

    private

    def list_of_rooms
      rooms = []
      (1..20).to_a.each do |num|
        rooms << Hotel::Room.new(num, 200)
      end
      return rooms
    end

  end # end of Admin class
end # end of Hotel module
