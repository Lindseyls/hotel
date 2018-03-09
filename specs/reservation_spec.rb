require_relative 'spec_helper'

describe "Reservation class" do
  describe "Initializer" do

    it "must be an instance of reservation" do
      check_in_date = Date.new(2018, 4, 7)
      check_out_date = Date.new(2018, 4, 21)
      room_info = Hotel::Room.new(9, 200)
      reserv = Hotel::Reservation.new(check_in_date, check_out_date, room_info)
      reserv.must_be_instance_of Hotel::Reservation
    end

  end # end of describe "Initializer"




end # end of describe "Reservation class"
