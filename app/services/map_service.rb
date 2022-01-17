# frozen_string_literal: true

class MapService
  class << self
    def conn
      Faraday.new('http://www.mapquestapi.com/')
    end

    def parse_json(url, params)
      JSON.parse(conn.get(url, params).body, symbolize_names: true)
    end

    def get_coordinates(location)
      parse_json('geocoding/v1/address', { key: ENV['mapquest_api_key'], location: location })
    end

    def get_travel_time(origin, desitination)
      parse_json('directions/v2/route', { key: ENV['mapquest_api_key'], from: origin, to: desitination })
    end
  end
end
