# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksForecast do
  describe '#initialize' do
    before :each do
      @books_data = {
        total_books_found: 200,
        books: [
          Book.new({ isbn: ['1234567890123'], title: 'A', publisher: ['XYZ'] }),
          Book.new({ isbn: ['1232345789023'], title: 'B', publisher: ['XYZ'] }),
          Book.new({ isbn: ['1234509439012'], title: 'C', publisher: ['XYZ'] }),
          Book.new({ isbn: ['1234376845658'], title: 'D', publisher: ['XYZ'] }),
          Book.new({ isbn: ['1234237652361'], title: 'E', publisher: ['XYZ'] })
        ]
      }
      @forecast_data = {
        destination: 'Denver,CO',
        forecast: {
          summary: 'Cloudy',
          temperature: 42.0
        }
      }

      @books_forecast = BooksForecast.new(@books_data, @forecast_data)
    end

    it 'exists' do
      expect(@books_forecast).to be_a BooksForecast
    end

    it 'has readable attributes' do
      expect(@books_forecast.id).to eq 'null'
      expect(@books_forecast.destination).to eq @forecast_data[:destination]
      expect(@books_forecast.forecast).to eq @forecast_data[:forecast]
      expect(@books_forecast.total_books_found).to eq @books_data[:total_books_found]
      expect(@books_forecast.books).to eq @books_data[:books]
    end
  end
end
