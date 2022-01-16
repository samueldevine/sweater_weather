class WeatherFacade
  class << self
    def get_weather_data(lat, long)
      payload = WeatherService.get_weather_data(lat, long)
      Weather.new(payload)
    end
  end
end
