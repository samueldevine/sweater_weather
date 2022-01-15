require 'rails_helper'

RSpec.describe GeocodeFacade do
  describe '::get_lat_long' do
    it 'returns only the lat and lng for a given location', :vcr do
      location = 'Denver, CO'
      lat_lng = GeocodeFacade.get_lat_long(location)

      expect(lat_lng).to be_a Hash
      expect(lat_lng).to have_key :lat
      expect(lat_lng).to have_key :lng
      expect(lat_lng[:lat]).to eq 39.738453
      expect(lat_lng[:lng]).to eq -104.984853
    end
  end
end
