# frozen_string_literal: true

class Weather
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @id              = 'null'
    @current_weather = {
      datetime: Time.at(data[:current][:dt]).strftime('%Y-%m-%d %H:%M:%S %z'),
      sunrise: Time.at(data[:current][:sunrise]).strftime('%Y-%m-%d %H:%M:%S %z'),
      sunset: Time.at(data[:current][:sunset]).strftime('%Y-%m-%d %H:%M:%S %z'),
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uvi],
      visibility: data[:current][:visibility],
      conditions: data[:current][:weather].first[:description],
      icon: data[:current][:weather].first[:icon]
    }
    @daily_weather   =
      data[:daily][0..4].map do |day|
        {
          date: Time.at(day[:dt]).strftime('%Y-%m-%d'),
          sunrise: Time.at(day[:sunrise]).strftime('%Y-%m-%d %H:%M:%S %z'),
          sunset: Time.at(day[:sunset]).strftime('%Y-%m-%d %H:%M:%S %z'),
          max_temp: day[:temp][:max],
          min_temp: day[:temp][:min],
          conditions: day[:weather].first[:description],
          icon: day[:weather].first[:icon]
        }
      end
    @hourly_weather  =
      data[:hourly][0..7].map do |hour|
        {
          time: Time.at(hour[:dt]).strftime('%H:%M:%S'),
          temperature: hour[:temp],
          conditions: hour[:weather].first[:description],
          icon: hour[:weather].first[:icon]
        }
      end
  end
end
