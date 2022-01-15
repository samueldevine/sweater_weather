class GeocodeFacade
  class << self
    def get_lat_long(location)
      GeocodeService.get_lat_long(location)[:results].first[:locations].first[:latLng]
    end
  end
end
