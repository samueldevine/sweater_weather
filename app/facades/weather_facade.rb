# frozen_string_literal: true

class WeatherFacade
  class << self
    def get_weather_data(lat, long)
      Weather.new(WeatherService.get_weather_data(lat, long))
    end
  end
end
