require_relative 'spec_helper'

describe "Admin class" do
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
      admin.rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end

    it "creates a reservation" do
      admin = Hotel::Admin.new

      admin.must_respond_to :reservations
      admin.reservations.must_be_kind_of Array
      admin.reservations.length.must_equal 0

    end

  end # end of describe "Initializer"


  def "list_rooms method" do

  end


  def "add_reservation(check_in, check_out) method" do

  end


  def "list_reservations(date)" do

  end


  def "total_cost(reservation)" do

  end

end # describe "Admin class"
