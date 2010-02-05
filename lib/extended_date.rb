class Date

  # Returns the date of the last day to a given month of 
  # a date pass as parameter.
  def self.end_of_month(date)
    date ||= Date.today
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

#  def to_datetime
#    DateTime.new(self.year, self.month,self.day)
#  end

  # Returns the date of the first day of the month 
  # of a given date pass as parameter
  def self.beginning_of_month(date)
    date ||= Date.today
    Date.new(date.year, date.month, 1)
  end

  def self.civil_by_string(string)
    d = string.split('-')
    return '' if d.length != 3
    Date.civil(d[0].to_i, d[1].to_i, d[2].to_i)
  end

end
