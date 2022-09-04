# frozen_string_literal: true

require_relative "business_hours/version"

module BusinessHours
  require 'date'
  require 'time'

  START_TIME = 9
  END_TIME = 17
  BUSINESS_DAYS = (1..5)
  BUSINESS_HOURS = (9..17)

  def self.greetings(name)
    puts "Hi #{name}!"
  end

  def self.is?(current_time = DateTime.now)
    BUSINESS_DAYS.include?(current_time.wday) && BUSINESS_HOURS.include?(current_time.hour)
  end

  def self.next_day(current_time = DateTime.now)
    (current_time.to_date + count_day(current_time.wday)).to_time + START_TIME*60**2
  end

  def self.previous_day(current_time = DateTime.now)
    (current_time.to_date - count_day(current_time.wday, true)).to_time + START_TIME*60**2
  end

  def self.count_day(wday, previous = false)
    case wday
    when 0..4
      previous && 0.eql?(wday) ? 2 : previous && 1.eql?(wday) ? 3 : 1
    when 5
      previous ? 1 : 3
    when 6
      previous ? 1 : 2
    end
  end
end
