class Date

  # Returns the date of the last day to a given month of 
  # a date pass as parameter.
  def self.end_of_month(date)
    end_of_month = nil

    if date.month == 2
      begin
        end_of_month = Date.new(date.year, date.month, 29)
      rescue
        end_of_month = Date.new(date.year, date.month, 28)
      end
    else
      begin
        end_of_month = Date.new(date.year, date.month, 31)
      rescue
        end_of_month = Date.new(date.year, date.month, 30)
      end
    end

    end_of_month # making the return value more clear

  end

end
