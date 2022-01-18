# frozen_string_literal: true

class RoadtripFacade < MapFacade
  class << self
    def create_roadtrip(origin, destination)
      coordinates = MapFacade.get_coordinates(destination)
      travel_time = get_travel_time(origin, destination)

      if travel_time.nil?
        travel_time = 'impossible'
        roadtrip_data = {
          origin: origin,
          destination: destination,
          travel_time: travel_time,
          weather_at_eta: {
          }
        }
      else
        travel_time_hrs = travel_time / 3600
        weather = WeatherFacade.get_weather_data(coordinates[:lat], coordinates[:lng])
        weather_at_eta = weather.hourly_weather[travel_time_hrs]
        roadtrip_data = {
          origin: origin,
          destination: destination,
          travel_time: travel_time,
          weather_at_eta: {
            temperature: weather_at_eta[:temperature],
            conditions: weather_at_eta[:conditions]
          }
        }
      end

      Roadtrip.new(roadtrip_data)
    end
  end
end
