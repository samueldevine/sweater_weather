class WeatherFacade
  class << self
    def get_weather_data(lat, long)
      payload = WeatherService.get_weather_data(lat, long)

      payload[:id] = 'null'
      payload[:current][:dt] = Time.at(payload[:current][:dt])
      payload[:current][:sunrise] = Time.at(payload[:current][:sunrise])
      payload[:current][:sunset] = Time.at(payload[:current][:sunset])
      payload[:daily].first[:dt] = Time.at(payload[:daily].first[:dt])
      payload[:daily].first[:sunrise] = Time.at(payload[:daily].first[:sunrise])
      payload[:daily].first[:sunset] = Time.at(payload[:daily].first[:sunset])
      payload[:hourly].first[:dt] = Time.at(payload[:hourly].first[:dt])

      payload
    end
  end
end
