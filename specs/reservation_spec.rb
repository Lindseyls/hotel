require_relative 'spec_helper'

describe "Reservation class" do
  describe "Initializer" do
    before do
      @check_in = Date.new(2018, 4, 7)
      @check_out = Date.new(2018, 4, 21)
      @room = Hotel::Room.new(9, 200)
      @reservation = Hotel::Reservation.new(@check_in, @check_out, @room)
    end

    it "must be an instance of reservation" do
      @reservation.must_be_instance_of Hotel::Reservation
    end

    it "reads the check_in date" do
      @reservation.must_respond_to :check_in
      @reservation.check_in.must_be_kind_of Date
    end

    it "reads the check_out date" do
      @reservation.must_respond_to :check_out
      @reservation.check_out.must_be_kind_of Date
    end

    it "room must be an instance of room" do
      @reservation.must_respond_to :room
      @reservation.room.must_be_instance_of Hotel::Room
      @reservation.room.room_num.must_equal 9
    end

  end # end of describe "Initializer"




end # end of describe "Reservation class"
