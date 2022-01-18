# frozen_string_literal: true

class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @id             = 'null'
    @start_city     = data[:origin]
    @end_city       = data[:destination]
    @travel_time    = format_time(data[:travel_time])
    @weather_at_eta = data[:weather_at_eta]
  end

  def format_time(time_in_secs)
    return time_in_secs if time_in_secs.class == String

    time_str = Time.at(time_in_secs).utc.strftime('%H hours, %M minutes')
    times = time_str.split(', ')

    formatted_time = times.map do |time|
      if time[0] != '0'
        time
      elsif time[0] == '0' && time[1] == '0'
        ''
      elsif time[0] == '0' && time[1] == '1'
        time[1..-2]
      else
        time[1..-1]
      end
    end.join(', ')

    if formatted_time[0..1] == ', '
      formatted_time[2..-1]
    elsif formatted_time[-2..-1] == ', '
      formatted_time[0..-3]
    else
      formatted_time
    end
  end
end
