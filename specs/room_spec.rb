require_relative 'spec_helper'

xdescribe "Room class" do
  describe "initialize" do

    it "must be an instance of Room" do
      room = Hotel::Room.new(1, 200)
      room.must_be_instance_of Hotel::Room
    end

    it "reads the room number" do
      room = Hotel::Room.new(9, 200)
      room.must_respond_to :room_num
      room.room_num.must_be_kind_of Integer
      room.room_num.must_equal 9
    end

    it "reads the rate of the room" do
      room = Hotel::Room.new(9, 200)
      room.must_respond_to :rate
      room.rate.must_be_instance_of Integer
      room.rate.must_equal 200
    end

  end # end of describe "You can create a Room instance"

  describe "hotel_room method" do

    it "raises an ArgumentError for invalid room numbers" do
      proc {Hotel::Room.new(0)}.must_raise ArgumentError
      proc {Hotel::Room.new(21)}.must_raise ArgumentError
    end

  end # end of describe "hotel_room method"
end # end of describe "Room class"
