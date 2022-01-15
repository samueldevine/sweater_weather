class GeocodeService
  class << self
    def conn
      Faraday.new('http://www.mapquestapi.com/geocoding/v1/')
    end

    def parse_json(url, params)
      JSON.parse(conn.get(url, params).body, symbolize_names: true)
    end

    def get_lat_long(location)
      parse_json('address', {key: ENV['mapquest_api_key'], location: location})
    end
  end
end
