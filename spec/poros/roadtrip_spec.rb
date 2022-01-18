require 'rails_helper'

RSpec.describe Roadtrip do
  describe '#initialize' do
    before :each do
      @roadtrip = Roadtrip.new(
        {
          origin: 'Denver, CO',
          desitination: 'Estes Park, CO',
          travel_time: 7200,
          weather_at_eta: {
            temperature: 75.0,
            conditions: 'clear skies and sunny'
          }
        }
      )
    end

    it 'exists' do
      expect(@roadtrip).to be_a Roadtrip
    end

    it 'has readable attributes' do
      expect(@roadtrip.start_city).to eq 'Denver, CO'
      expect(@roadtrip.end_city).to eq 'Estes Park, CO'
      expect(@roadtrip.travel_time).to eq '02 hours, 00 minutes'
      expect(@roadtrip.weather_at_eta[:temperature]).to eq 75.0
      expect(@roadtrip.weather_at_eta[:conditions]).to eq 'clear skies and sunny'
    end
  end
end
