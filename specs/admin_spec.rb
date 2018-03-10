require_relative 'spec_helper'

xdescribe "Admin class" do
  describe "Initializer" do

    it "must be an instance of admin" do
      admin = Hotel::Admin.new
      admin.must_be_instance_of Hotel::Admin
    end

    it "creates a list of all 20 rooms" do
      admin = Hotel::Admin.new

      admin.must_respond_to :rooms
      admin.rooms.must_be_kind_of Array
      admin.rooms.length.must_equal 20
      admin.rooms.must_equal @rooms
      admin.rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end

    it "creates a reservation" do
      admin = Hotel::Admin.new

      admin.must_respond_to :reservations
      admin.reservations.must_be_kind_of Array
      admin.reservations.must_equal @reservations
      admin.reservations.length.must_equal 0

    end

  end # end of describe "Initializer"


  # describe "list_rooms method" do
  #   admin = Hotel::Admin.new
  #
  #   admin.list_rooms.must_be_kind_of Array
  #
  # end
  #

  describe "add_reservation(check_in, check_out) method" do

  end


  describe "list_reservations(date)" do

  end


  describe "total_cost(reservation)" do

  end

end # end of describe "Admin class"
