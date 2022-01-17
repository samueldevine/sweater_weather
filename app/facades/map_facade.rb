# frozen_string_literal: true

class MapFacade
  class << self
    def get_coordinates(location)
      MapService.get_coordinates(location)[:results].first[:locations].first[:latLng]
    end

    def get_travel_time(origin, desitination)
      MapService.get_travel_time(origin, desitination)[:route][:time]
    end
  end
end
