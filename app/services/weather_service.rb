class WeatherService
  class << self
    def conn
      Faraday.new('https://api.openweathermap.org/data/2.5/')
    end

    def parse_json(url, params)
      JSON.parse(conn.get(url, params).body, symbolize_names: true)
    end

    def get_weather_data(lat, long)
      url = 'onecall'
      params = {
        lat: lat,
        lon: long,
        units: 'imperial',
        exclude: 'minutely,alerts',
        appid: ENV['one_call_api_key']
      }

      parse_json(url, params)
    end
  end
end
