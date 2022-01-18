# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roadtrip Request', type: :request do
  describe 'POST /api/v1/road_trip' do
    describe 'successful request' do
      before :each do
        @headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        @user = User.create!(
          email: 'user_1@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        )
      end

      it 'returns the trip information and weather upon arrival', :vcr do
        params = {
          origin: 'Denver, CO',
          destination: 'Estes Park, CO',
          api_key: @user.api_key
        }
        post '/api/v1/road_trip', params: params.to_json, headers: @headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq 200

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :data
        expect(body[:data]).to have_key :type
        expect(body[:data][:type]).to eq 'roadtrip'
        expect(body[:data]).to have_key :id
        expect(body[:data][:id]).to eq 'null'
        expect(body[:data][:attributes]).to have_key :start_city
        expect(body[:data][:attributes]).to have_key :end_city
        expect(body[:data][:attributes]).to have_key :travel_time
        expect(body[:data][:attributes][:weather_at_eta]).to have_key :temperature
        expect(body[:data][:attributes][:weather_at_eta]).to have_key :conditions
      end
    end

    describe 'unsuccessful request' do
      before :each do
        @headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        @user = User.create!(
          email: 'user_1@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        )
      end

      it 'does not return weather or travel time if the trip is impossible', :vcr do
        params = {
          origin: 'New York, NY',
          destination: 'London, UK',
          api_key: @user.api_key
        }
        post '/api/v1/road_trip', params: params.to_json, headers: @headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq 200

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :data
        expect(body[:data]).to have_key :type
        expect(body[:data][:type]).to eq 'roadtrip'
        expect(body[:data]).to have_key :id
        expect(body[:data][:id]).to eq 'null'
        expect(body[:data][:attributes]).to have_key :start_city
        expect(body[:data][:attributes]).to have_key :end_city
        expect(body[:data][:attributes][:travel_time]).to eq 'impossible'
        expect(body[:data][:attributes][:weather_at_eta]).to eq({})
      end

      it 'returns a 401 status if no api key is provided', :vcr do
        params = {
          origin: 'Denver, CO',
          destination: 'Estes Park, CO'
        }
        post '/api/v1/road_trip', params: params.to_json, headers: @headers

        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq 401

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :errors
        expect(body[:errors][:detail]).to eq 'Unauthorized'
      end
    end
  end
end
