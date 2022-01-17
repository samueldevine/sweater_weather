require 'rails_helper'

RSpec.describe 'Login', type: :request do
  describe 'POST /api/v1/login' do
    before :each do
      @user = User.create!(
        email: 'user_1@gmail.com',
        password: 'user_1',
        password_confirmation: 'user_1'
      )
      @headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    end

    describe 'successful request' do
      it "returns the user's email and api_key", :vcr do
        params = {
          email: 'user_1@gmail.com',
          password: 'user_1'
        }
        post '/api/v1/sessions', params: params.to_json, headers: @headers

        expect(response).to be_successful
        expect(response.status).to eq 200

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :data
        expect(body[:data]).to have_key :type
        expect(body[:data][:type]).to eq "user"
        expect(body[:data]).to have_key :id
        expect(body[:data][:attributes]).to have_key :email
        expect(body[:data][:attributes][:email]).to eq 'user_1@gmail.com'
        expect(body[:data][:attributes]).to have_key :api_key
        expect(body[:data][:attributes][:api_key]).to eq @user.api_key
        expect(body[:data][:attributes]).to_not have_key :password
        expect(body[:data][:attributes]).to_not have_key :password_confirmation
        expect(body[:data][:attributes]).to_not have_key :password_digest
      end
    end

    describe 'unsuccessful request' do
      it "returns an unsuccessful status code and an error message", :vcr do
        params = {
          email: 'user_1@gmail.com',
          password: 'wrong_password'
        }
        post '/api/v1/sessions', params: params.to_json, headers: @headers

        expect(response).to_not be_successful
        expect(response.status).to eq 403
        expect(response.content_type).to eq("application/json")

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body).to have_key :errors
        expect(body[:errors]).to have_key :detail
        expect(body[:errors][:detail]).to eq 'Incorrect username or password'
      end
    end
  end
end
