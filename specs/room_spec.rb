require_relative 'spec_helper'

describe "Room class" do

  describe "initialize" do
    before do
      @room = Hotel::Room.new(9, 200)
    end

    it "must be an instance of Room" do
      @room.must_be_instance_of Hotel::Room
    end

    it "reads the room number" do
      @room.must_respond_to :room
      @room.room.must_be_kind_of Integer
      @room.room.must_equal 9
    end

    it "reads the rate of the @room" do
      @room = Hotel::Room.new(9, 200)
      @room.must_respond_to :rate
      @room.rate.must_be_instance_of Integer
      @room.rate.must_equal 200
    end

  end # end of describe "initialize"

  describe "hotel_room method" do

    it "raises an ArgumentError for invalid room numbers" do
      proc {Hotel::Room.new(0, 200)}.must_raise ArgumentError
      proc {Hotel::Room.new(21, 200)}.must_raise ArgumentError
    end

  end # end of describe "hotel_room method"
end # end of describe "Room class"
