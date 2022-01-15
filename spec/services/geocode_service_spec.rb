require 'rails_helper'

RSpec.describe GeocodeService do
  describe '::conn' do
    it 'creates a Faraday connection' do
      expect(GeocodeService.conn).to be_a Faraday::Connection
    end
  end

  describe '::get_lat_long', :vcr do
    it 'returns parsed latitude and longitude for a given location' do
      location_1 = 'Denver, CO'
      response = GeocodeService.get_lat_long(location_1)

      expect(response).to be_a Hash
      expect(response).to have_key :results
      expect(response[:results]).to be_an Array
      expect(response[:results].first).to have_key :locations
      expect(response[:results].first[:locations]).to be_an Array
      expect(response[:results].first[:locations].first).to have_key :latLng
      expect(response[:results].first[:locations].first[:latLng]).to have_key :lat
      expect(response[:results].first[:locations].first[:latLng][:lat]).to eq 39.738453
      expect(response[:results].first[:locations].first[:latLng]).to have_key :lng
      expect(response[:results].first[:locations].first[:latLng][:lng]).to eq -104.984853
    end
  end
end
