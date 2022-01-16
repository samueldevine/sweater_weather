require 'rails_helper'

RSpec.describe 'Backgrounds', type: :request do
  describe 'GET /backgrounds' do
    it 'returns an image matching the location search parameter', :vcr do
      get '/api/v1/backgrounds',
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
      expect(payload[:data][:type]).to eq 'image'
      expect(payload[:data][:attributes][:image]).to have_key :location
      expect(payload[:data][:attributes][:image][:location]).to eq 'denver,co'
      expect(payload[:data][:attributes][:image]).to have_key :image_url
      expect(payload[:data][:attributes][:image]).to have_key :credit
      expect(payload[:data][:attributes][:image][:credit]).to have_key :source
      expect(payload[:data][:attributes][:image][:credit][:source]).to eq 'unsplash.com'
      expect(payload[:data][:attributes][:image][:credit]).to have_key :photographer
      expect(payload[:data][:attributes][:image][:credit]).to have_key :photographer_profile
    end
  end
end
