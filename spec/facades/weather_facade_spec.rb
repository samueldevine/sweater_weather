require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '::get_lat_long' do
    it 'returns only the lat and lng for a given location', :vcr do
      lat = 39.738453
      long = -104.984853
      response = WeatherFacade.get_weather_data(lat, long)

      expect(response[:current][:dt]).to be_a Time
      expect(response[:current][:sunrise]).to be_a Time
      expect(response[:current][:sunset]).to be_a Time
      expect(response[:daily].first[:dt]).to be_a Time
      expect(response[:daily].first[:sunrise]).to be_a Time
      expect(response[:daily].first[:sunset]).to be_a Time
      expect(response[:hourly].first[:dt]).to be_a Time
    end
  end
end
