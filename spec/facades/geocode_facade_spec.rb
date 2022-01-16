# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeocodeFacade do
  describe '::get_lat_long' do
    it 'returns only the lat and lng for a given location', :vcr do
      location = 'Denver, CO'
      lat_long = GeocodeFacade.get_lat_long(location)

      expect(lat_long).to be_a Hash
      expect(lat_long).to have_key :lat
      expect(lat_long).to have_key :lng
      expect(lat_long[:lat]).to eq 39.738453
      expect(lat_long[:lng]).to eq(-104.984853)
    end
  end
end
