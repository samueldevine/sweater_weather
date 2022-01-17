require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  describe 'POST /api/v1/users' do
    describe 'successful request' do
      before :each do
        @headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      end

      it "returns the user's email and api_key", :vcr do
        params = {
          email: 'user_1@gmail.com',
          password: 'user_1',
          password_confirmation: 'user_1'
        }
        post '/api/v1/users', params: params.to_json, headers: @headers

        expect(response.content_type).to eq("application/json")
        expect(response.status).to eq 201

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :data
        expect(body[:data]).to have_key :type
        expect(body[:data][:type]).to eq "user"
        expect(body[:data]).to have_key :id
        expect(body[:data][:attributes]).to have_key :email
        expect(body[:data][:attributes][:email]).to eq 'user_1@gmail.com'
        expect(body[:data][:attributes]).to have_key :api_key
        expect(body[:data][:attributes]).to_not have_key :password
        expect(body[:data][:attributes]).to_not have_key :password_confirmation
        expect(body[:data][:attributes]).to_not have_key :password_digest
      end

      it "always downcases the user's email" do
        params = {
          email: 'UsEr_2@GmAiL.cOm',
          password: 'user_2',
          password_confirmation: 'user_2'
        }
        post '/api/v1/users', params: params.to_json, headers: @headers

        expect(response.content_type).to eq("application/json")
        expect(response.status).to eq 201

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body[:data][:attributes]).to have_key :email
        expect(body[:data][:attributes][:email]).to eq 'user_2@gmail.com'
      end
    end

    describe 'unsuccessful request' do
      before :each do
        @headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      end

      it "returns an error if password and password confirmation don't match", :vcr do
        params = {
          email: 'user_1@gmail.com',
          password: 'user_1',
          password_confirmation: 'user_2'
        }
        post '/api/v1/users', params: params.to_json, headers: @headers

        expect(response).to_not be_successful
        expect(response.status).to eq 400
        expect(response.content_type).to eq("application/json")

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :errors
        expect(body[:errors]).to have_key :detail
        expect(body[:errors][:detail]).to eq ["Password confirmation doesn't match Password"]
      end

      it "returns an error if email is not unique", :vcr do
        user = User.create!(
          email: 'user_1@gmail.com',
          password: 'user_1',
          password_confirmation: 'user_1'
        )
        params = {
          email: 'user_1@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }
        post '/api/v1/users', params: params.to_json, headers: @headers

        expect(response).to_not be_successful
        expect(response.status).to eq 400
        expect(response.content_type).to eq("application/json")

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :errors
        expect(body[:errors]).to have_key :detail
        expect(body[:errors][:detail]).to eq ["Email has already been taken"]
      end

      it "returns an error if a field is missing", :vcr do
        params = {
          email: '',
          password: 'password',
          password_confirmation: 'password'
        }
        post '/api/v1/users', params: params.to_json, headers: @headers

        expect(response).to_not be_successful
        expect(response.status).to eq 400
        expect(response.content_type).to eq("application/json")

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :errors
        expect(body[:errors]).to have_key :detail
        expect(body[:errors][:detail]).to eq ["Email can't be blank"]
      end
    end
  end
end
