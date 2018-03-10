require_relative 'spec_helper'

describe "Admin class" do
  describe "initialize" do
    before do
      @admin = Hotel::Admin.new
    end

    it "must be an instance of admin" do
      @admin.must_be_instance_of Hotel::Admin
    end

    it "has access to a list of all 20 rooms" do
      @admin.must_respond_to :rooms
      @admin.rooms.must_be_kind_of Array
      @admin.rooms.length.must_equal 20
      @admin.rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end

    it "access to reservations" do
      @admin.must_respond_to :reservations
      @admin.reservations.must_be_kind_of Array
      @admin.reservations.length.must_equal 0

    end

  end # end of describe "initialize"

  describe "add_reservation method" do
    before do
      @check_in = Date.new(2018, 4, 14)
      @check_out = Date.new(2018, 4, 21)
      @admin = Hotel::Admin.new
      @reservation = @admin.add_reservation(@check_in, @check_out)
    end

    it "creates a instance of reservation with the check_in and check_out dates" do
      @reservation.must_be_instance_of Hotel::Reservation
    end

    it "correctly list the reserved room" do
      @reservation.check_in.must_equal @check_in
      @reservation.check_out.must_equal @check_out
      @reservation.check_in.must_be_kind_of Date
      @reservation.check_out.must_be_kind_of Date
      @reservation.room.room_num.must_be_kind_of Integer
      @reservation.room.rate.must_equal 200
      @reservation.total_cost.must_equal 1400
    end

    it "accurately addes the reserved room to the reservation list" do
      number_of_reserved_rooms = @admin.reservations.length

      @admin.reservations.length.must_equal number_of_reserved_rooms
    end

    it "must raise an ArgumentError if the check_in and/or check_out date is invalid" do
      check_in = Date.new(2018412)
      check_out = Date.new(2018410)
      proc { @admin.add_reservation(check_in, check_out) }.must_raise ArgumentError
    end

    it "must raise an ArgumentError if the date range is invalid" do
      check_in = Date.new(2018, 4, 12)
      check_out = Date.new(2018, 4, 10)
      proc { @admin.add_reservation(check_in, check_out) }.must_raise ArgumentError
    end

  end # end of describe "add_reservation method" do


  describe "list_reservations method" do
    before do
      @admin = Hotel::Admin.new
      @admin.add_reservation(Date.new(2018, 3, 22), Date.new(2018, 3, 24))
      @admin.add_reservation(Date.new(2018, 4, 21), Date.new(2018, 4, 24))
      @admin.add_reservation(Date.new(2018, 4, 22), Date.new(2018, 4, 24))
    end

    it "correctly adds all the new reservations" do
      reservations = @admin.list_reservations(Date.new(2018, 4, 22))

      @admin.reservations.length.must_equal 3
      reservations.length.must_equal 2
    end

    it "returns zero if no reservations are found" do
      reservations = @admin.list_reservations(Date.new(2018, 3, 10))

      reservations.length.must_equal 0
    end

    it "must raise an ArgumentError if the check_in and/or check_out date is invalid" do
      check_in = 2018-03-04
      check_out = 2018-03-06
      proc { @admin.list_reservations(check_in) }.must_raise ArgumentError
      proc { @admin.list_reservations(check_out) }.must_raise ArgumentError
    end

  end # end of describe "list_reservations method"
end # end of describe "Admin class"
