require 'rails_helper'

RSpec.describe 'Forecast', type: :request do
  describe 'GET /forecast' do
    it 'returns current weather data, and hourly and daily forecasts', :vcr do
      get '/api/v1/forecast',
      params: {
        location: 'denver,co'
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      expect(response).to be_successful
      expect(response.status).to eq 200

      payload = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
