# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MapFacade do
  describe '::get_coordinates' do
    it 'returns only the lat and lng for a given location', :vcr do
      location = 'Denver, CO'
      coordinates = MapFacade.get_coordinates(location)

      expect(coordinates).to be_a Hash
      expect(coordinates).to have_key :lat
      expect(coordinates).to have_key :lng
      expect(coordinates[:lat]).to eq 39.738453
      expect(coordinates[:lng]).to eq(-104.984853)
    end
  end
end
