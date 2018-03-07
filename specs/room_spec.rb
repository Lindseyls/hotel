require_relative 'spec_helper'

describe "Room class" do
  describe "You can create a Room instance" do

    it "Can be created" do
      (1..20).each do |value|
        room = Hotel::Room.new(1)
        room.must_be_instance_of Hotel::Room
      end
    end


    it "Raises an ArgumentError for invalid parameters" do
      proc {Hotel::Room.new(0)}.must_raise ArgumentError
      proc {Hotel::Room.new(21)}.must_raise ArgumentError
    end



  end # end of describe "You can create a Room instance"
end # describe "Admin class"
