require_relative 'spec_helper'

describe "Reservation class" do

  before do
    @check_in = Date.new(2018, 4, 14)
    @check_out = Date.new(2018, 4, 21)
    @room = 9
    @rate = 200
    @reservation = Hotel::Reservation.new(@check_in, @check_out, @room, @rate)
  end

  describe "initialize" do

    it "must be an instance of reservation" do
      @reservation.must_be_instance_of Hotel::Reservation
    end

    it "reads the check_in date" do
      @reservation.check_in.must_be_kind_of Date
      @reservation.check_in.must_equal @check_in
    end

    it "reads the check_out date" do
      @reservation.check_out.must_be_kind_of Date
      @reservation.check_out.must_equal @check_out
    end

    it "is a kind of DateRange" do
      @reservation.must_be_kind_of Hotel::DateRange
    end

    it "reads in the correct room information" do
      @reservation.must_respond_to :room
      @reservation.room.must_equal 9
    end

    it "reads in the correct rate information" do
      @reservation.must_respond_to :rate
      @reservation.rate.must_equal 200
    end
  end # end of describe "initialize"

  describe "calculate_total_cost" do
    it "calculates the price" do
      expected_price = @rate * (@check_out - @check_in)
      @reservation.total_cost.must_equal expected_price
    end
  end

end # end of describe "Reservation class"
