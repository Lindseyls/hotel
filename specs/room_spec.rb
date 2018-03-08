require_relative 'spec_helper'

describe "Room class" do
  describe "You can create a Room instance" do

    it "Can be created" do
      room = Hotel::Room.new(1)
      room.must_be_instance_of Hotel::Room
    end

    it "Correcty initialize with the cost per room" do
      room_cost = Hotel::Room.new(9)
      room_cost.cost.must_equal 200
    end

  end # end of describe "You can create a Room instance"

  describe "hotel room method" do
    it "Raises an ArgumentError for invalid parameters" do
      proc {Hotel::Room.new(0)}.must_raise ArgumentError
      proc {Hotel::Room.new(21)}.must_raise ArgumentError
    end
  end # end of describe "hotel room method"

end # describe "Admin class"
