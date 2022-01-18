# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Roadtrip do
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

  describe '#initialize' do
    it 'exists' do
      expect(@roadtrip).to be_a Roadtrip
    end

    it 'has readable attributes' do
      expect(@roadtrip.start_city).to eq 'Denver, CO'
      expect(@roadtrip.end_city).to eq 'Estes Park, CO'
      expect(@roadtrip.travel_time).to eq '2 hours'
      expect(@roadtrip.weather_at_eta[:temperature]).to eq 75.0
      expect(@roadtrip.weather_at_eta[:conditions]).to eq 'clear skies and sunny'
    end
  end

  describe '#format_time' do
    it 'returns a time string' do
      time_1 = 60
      time_2 = 3600
      time_3 = 5000
      time_4 = 40000

      expect(@roadtrip.format_time(time_1)).to eq '1 minute'
      expect(@roadtrip.format_time(time_2)).to eq '1 hour'
      expect(@roadtrip.format_time(time_3)).to eq '1 hour, 23 minutes'
      expect(@roadtrip.format_time(time_4)).to eq '11 hours, 6 minutes'
    end
  end
end
