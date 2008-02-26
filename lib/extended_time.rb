require 'date'
class Time
 def to_datetime
# Convert seconds + microseconds into a fractional number of seconds
#   seconds = sec + Rational(usec, 10**6)

# Convert a UTC offset measured in minutes to one measured in a
   # fraction of a day.
#   offset = Rational(utc_offset, 60 * 60 * 24)
#   DateTime.new(year, month, day, hour, min, seconds, offset)
   DateTime.new(self.year, self.month, self.day, self.hour, self.min, self.sec)
 end
end
