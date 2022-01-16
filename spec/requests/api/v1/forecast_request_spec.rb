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

      expect(payload).to have_key :data
      expect(payload[:data][:id]).to eq 'null'
      expect(payload[:data][:type]).to eq 'forecast'
      expect(payload[:data][:attributes]).to have_key :current_weather
      expect(payload[:data][:attributes]).to have_key :daily_weather
      expect(payload[:data][:attributes][:daily_weather].length).to eq 5
      expect(payload[:data][:attributes]).to have_key :hourly_weather
      expect(payload[:data][:attributes][:hourly_weather].length).to eq 8
      expect(payload[:data][:attributes]).to_not have_key :minutely_weather
      expect(payload[:data][:attributes]).to_not have_key :alerts
    end
  end
end
