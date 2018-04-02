require_relative 'spec_helper'

describe "Admin class" do

  before do
    @admin = Hotel::Admin.new
  end

  describe "initialize" do

    it "must be an instance of admin" do
      @admin.must_be_instance_of Hotel::Admin
    end

    it "has access to a list of all 20 rooms" do
      @admin.must_respond_to :rooms
      @admin.rooms.must_be_kind_of Array
      @admin.rooms.length.must_equal 20
    end

    it "tracks room rate" do
      @admin.must_respond_to :room_rate
      @admin.room_rate.must_equal 200
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
      @room = 9
      @reservation = @admin.add_reservation(@room, @check_in, @check_out)
    end

    it "creates a instance of reservation with the check_in and check_out dates" do
      @reservation.must_be_instance_of Hotel::Reservation
    end

    it "raises an error for an invalid room" do
      [105, -12, "foo"].each do |room|
        proc {
          @admin.add_reservation(room, @check_in, @check_out)
        }.must_raise ArgumentError
      end
    end

    it "raises an error if no rooms are available" do
      @admin.add_reservation(10, @check_in, @check_out)

      proc {
        @admin.add_reservation(10, @check_in, @check_out)
      }.must_raise ArgumentError
    end

    it "correctly list the reserved room" do
      @reservation.check_in.must_equal @check_in
      @reservation.check_out.must_equal @check_out
      @reservation.check_in.must_be_kind_of Date
      @reservation.check_out.must_be_kind_of Date
      @reservation.room.must_be_kind_of Integer
      @reservation.total_cost.must_equal 1400
    end

    it "accurately addes the reserved room to the reservation list" do
      number_of_reserved_rooms = @admin.reservations.length

      @admin.reservations.length.must_equal number_of_reserved_rooms
    end

  end # end of describe "add_reservation method" do

  describe "list_reservations method" do
    before do
      @admin.add_reservation(1, Date.new(2018, 3, 22), Date.new(2018, 3, 24))
      @admin.add_reservation(2, Date.new(2018, 4, 21), Date.new(2018, 4, 24))
      @admin.add_reservation(3, Date.new(2018, 4, 22), Date.new(2018, 4, 24))
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

  end # end of describe "list_reservations method"

  describe "available_rooms method" do
    before do
      @check_in = Date.new(2018, 4, 14)
      @check_out = Date.new(2018, 4, 21)
    end

    it "lists out all the empty rooms with the given date range" do
      @admin.add_reservation(12, @check_in, @check_out)

      available_list = @admin.available_rooms(@check_in, @check_out)

      available_list.length.must_equal 19
      available_list.must_be_kind_of Array
    end

  end # end of describe "available_rooms method"
end # end of describe "Admin class"
