require 'rails_helper'

RSpec.describe 'Books Search' do
  describe 'GET /api/v1/book-search' do
    it 'returns current weather information and books that match the search', :vcr do
      get '/api/v1/book-search',
        params: {
          location: 'Denver,CO',
          quantity: 5
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }

      expect(response).to be_successful

      payload = JSON.parse(response.body, symbolize_names: true)

      expect(payload).to have_key :data
      expect(payload[:data][:id]).to eq 'null'
      expect(payload[:data][:type]).to eq 'books'
      expect(payload[:data][:attributes][:destination]).to eq 'Denver,CO'
      expect(payload[:data][:attributes][:forecast]).to have_key :summary
      expect(payload[:data][:attributes][:forecast]).to have_key :temperature
      expect(payload[:data][:attributes]).to have_key :total_books_found
      expect(payload[:data][:attributes]).to have_key :books
      expect(payload[:data][:attributes][:books]).to be_an Array
      expect(payload[:data][:attributes][:books].length).to eq 5

      # binding.pry
      payload[:data][:attributes][:books].each do |book|
        expect(book[:isbn]).to be_an Array
        expect(book[:title]).to be_a String
        expect(book[:publisher]).to be_an Array
      end
    end
  end
end
