require_relative 'spec_helper'

describe "Admin class" do
  describe "Initializer" do

    it "must be an instance of admin" do
      admin = Hotel::Admin.new
      admin.must_be_instance_of Hotel::Admin
    end

    it "access to a list of all 20 rooms" do
      admin = Hotel::Admin.new

      admin.must_respond_to :rooms
      admin.rooms.must_be_kind_of Array
      admin.rooms.length.must_equal 20
      admin.rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end

    it "access to reservations" do
      admin = Hotel::Admin.new

      admin.must_respond_to :reservations
      admin.reservations.must_be_kind_of Array
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

    it "creates a instance of reservation with the check_in and check_out dates" do
      @check_in = Date.new(2018, 4, 14)
      @check_out = Date.new(2018, 4, 21)
      admin = Hotel::Admin.new
      reservation = admin.add_reservation(@check_in, @check_out)

      reservation.must_be_instance_of Hotel::Reservation
    end

    it "correctly list the reserved room" do
      @check_in = Date.new(2018, 4, 14)
      @check_out = Date.new(2018, 4, 21)
      admin = Hotel::Admin.new
      reservation = admin.add_reservation(@check_in, @check_out)

      reservation.check_in.must_be_kind_of Date
      reservation.check_out.must_be_kind_of Date
      reservation.room.room_num.must_be_kind_of Integer
      reservation.room.rate.must_equal 200
      reservation.total_cost.must_equal 1400
    end

  end # end of describe "add_reservation(check_in, check_out) method" do


  describe "list_reservations(date)" do

  end


  # describe "total_cost(reservation)" do
  #
  # end

end # end of describe "Admin class"
