module Hotel
  class DateRange
    class InvalidDateRange < StandardError ; end

    attr_reader :check_in, :check_out

    def initialize(check_in, check_out)
      unless check_out > check_in
        raise InvalidDateRange.new("Invalid dates #{check_in} to #{check_out}")
      end

      @check_in = date_check(check_in)
      @check_out = date_check(check_out)
    end

    def nights
      return @check_out - @check_in
    end

    private

    # check to see if the check_in and check_out dates are invalid
    def date_check(date)
      if date.class == String
        date = Date.parse(date)
      elsif date.class != Date
        raise ArgumentError.new("Invalid date: #{date}. Please enter date in the form of '2018, 03, 10'")
      end
      return date
    end

  end
end
