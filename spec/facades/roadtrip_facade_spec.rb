# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoadtripFacade do
  describe '::create_roadtrip' do
    it 'returns a roadtrip object with travel time and weather', :vcr do
      roadtrip = RoadtripFacade.create_roadtrip('Denver, CO', 'Estes Park, CO')

      expect(roadtrip).to be_a Roadtrip
      expect(roadtrip.start_city).to eq 'Denver, CO'
      expect(roadtrip.end_city).to eq 'Estes Park, CO'
      expect(roadtrip.travel_time).to be_a String
      expect(roadtrip.travel_time).to eq '1 hour, 22 minutes'
      expect(roadtrip.weather_at_eta).to have_key :temperature
      expect(roadtrip.weather_at_eta).to have_key :conditions
    end
  end
end
