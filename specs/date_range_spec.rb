require_relative 'spec_helper'

describe Hotel::DateRange do

  describe "initialize" do
    it "can be initialized with two dates" do
      check_in = Date.new(2017, 01, 01)
      check_out = Date.new(2017, 01, 04)

      @range = Hotel::DateRange.new(check_in, check_out)

      @range.check_in.must_equal check_in
      @range.check_out.must_equal check_out
    end

    it "correctly returns the date if the check_in and check_out dates are strings" do
      check_in = "2018-4-14"
      check_out = "2018-4-21"
      @range = Hotel::DateRange.new(check_in, check_out)

      @range.check_in.must_be_kind_of Date
      @range.check_out.must_be_kind_of Date
    end

    it "must raise an ArgumentError if the check_in and/or check_out date is invalid" do
      check_in = 201841
      check_out = 2018410
      proc { Hotel::DateRange.new(check_in, check_out) }.must_raise ArgumentError
    end

    it "must raise an ArgumentError if the date range is invalid" do
      check_in = Date.new(2018, 4, 12)
      check_out = Date.new(2018, 4, 10)
      proc {
        Hotel::DateRange.new(check_in, check_out)
      }.must_raise Hotel::DateRange::InvalidDateRange
    end
  end

  describe "nights" do
    it "returns the correct number of nights" do
      nights = 3
      check_in = Date.new(2017, 01, 01)
      check_out = check_in + nights

      @range = Hotel::DateRange.new(check_in, check_out)

      @range.nights.must_equal nights
    end
  end

end
