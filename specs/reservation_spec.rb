require_relative 'spec_helper'

describe "Reservation class" do
  describe "Initializer" do
    before do
      @check_in = Date.new(2018, 4, 14)
      @check_out = Date.new(2018, 4, 21)
      @room = Hotel::Room.new(9, 200)
      @reservation = Hotel::Reservation.new(@check_in, @check_out, @room)
    end

    it "must raise an ArgumentError if the check_out date is invalid" do
      check_in = Date.new(2018, 4, 12)
      check_out = Date.new(2018, 4, 10)
      room_1 = Hotel::Room.new(9, 200)
      proc { Hotel::Reservation.new(check_in, check_out, room_1) }.must_raise ArgumentError
    end

    it "must be an instance of reservation" do
      @reservation.must_be_instance_of Hotel::Reservation
    end

    it "reads the check_in date" do
      @reservation.must_respond_to :check_in
      @reservation.check_in.must_be_kind_of Date
      @reservation.check_in.must_equal @check_in
    end

    it "reads the check_out date" do
      @reservation.must_respond_to :check_out
      @reservation.check_out.must_be_kind_of Date
      @reservation.check_out.must_equal @check_out
    end

    it "reas in the correct room information" do
      @reservation.must_respond_to :room
      @reservation.room.must_be_instance_of Hotel::Room
      @reservation.room.room_num.must_equal 9
      @reservation.room.rate.must_equal 200
    end

    it "reads in the rate and calculates the correct total cost" do
      @reservation.must_respond_to :total_cost
      @reservation.total_cost.must_be_kind_of Integer
      @reservation.total_cost.must_equal 1400
    end

  end # end of describe "Initializer"
end # end of describe "Reservation class"
