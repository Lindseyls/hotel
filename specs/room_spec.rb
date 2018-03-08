require_relative 'spec_helper'

describe "Room class" do
  describe "initialize" do

    it "you can create a Room instance" do
      room = Hotel::Room.new(1, 200)
      room.must_be_instance_of Hotel::Room
    end

    it "reads the room number" do
      room = Hotel::Room.new(9, 200)
      room.must_respond_to :room_num
      room.room_num.must_equal 9
      room.room_num.must_be_kind_of Integer
    end

  end # end of describe "You can create a Room instance"

  describe "hotel room method" do

    it "raises an ArgumentError for invalid room numbers" do
      proc {Hotel::Room.new(0)}.must_raise ArgumentError
      proc {Hotel::Room.new(21)}.must_raise ArgumentError
    end

  end # end of describe "hotel room method"

end # describe "Admin class"
