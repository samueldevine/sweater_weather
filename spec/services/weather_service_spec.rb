require 'rails_helper'

RSpec.describe WeatherService do
  describe '::conn' do
    it 'creates a Faraday connection' do
      expect(WeatherService.conn).to be_a Faraday::Connection
    end
  end

  describe '::get_weather_data', :vcr do
    it 'returns weather data for a given lat and long' do
      lat = 39.738453
      long = -104.984853
      response = WeatherService.get_weather_data(lat, long)

      expect(response).to be_a Hash
      expect(response).to_not have_key :minutely
      expect(response).to_not have_key :alerts

      expect(response).to have_key :current
      expect(response[:current]).to have_key :dt
      expect(response[:current][:dt]).to be_an Integer
      expect(response[:current]).to have_key :sunrise
      expect(response[:current][:sunrise]).to be_an Integer
      expect(response[:current]).to have_key :sunset
      expect(response[:current][:sunset]).to be_an Integer
      expect(response[:current]).to have_key :temp
      expect(response[:current][:temp]).to be_a Float
      expect(response[:current]).to have_key :feels_like
      expect(response[:current][:feels_like]).to be_a Float
      expect(response[:current]).to have_key :humidity
      expect(response[:current][:humidity]).to be_a_kind_of Numeric
      expect(response[:current]).to have_key :uvi
      expect(response[:current][:uvi]).to be_a_kind_of Numeric
      expect(response[:current]).to have_key :visibility
      expect(response[:current][:visibility]).to be_a_kind_of Numeric
      expect(response[:current]).to have_key :weather
      expect(response[:current][:weather]).to be_an Array
      expect(response[:current][:weather].first).to have_key :description
      expect(response[:current][:weather].first[:description]).to be_a String
      expect(response[:current][:weather].first).to have_key :icon
      expect(response[:current][:weather].first[:icon]).to be_a String

      expect(response).to have_key :daily
      expect(response[:daily]).to be_an Array
      expect(response[:daily].first).to have_key :dt
      expect(response[:daily].first[:dt]).to be_an Integer
      expect(response[:daily].first).to have_key :sunrise
      expect(response[:daily].first[:sunrise]).to be_an Integer
      expect(response[:daily].first).to have_key :sunset
      expect(response[:daily].first[:sunset]).to be_an Integer
      expect(response[:daily].first).to have_key :temp
      expect(response[:daily].first[:temp]).to be_a Hash
      expect(response[:daily].first[:temp]).to have_key :min
      expect(response[:daily].first[:temp][:min]).to be_a Float
      expect(response[:daily].first[:temp]).to have_key :max
      expect(response[:daily].first[:temp][:max]).to be_a Float
      expect(response[:daily].first).to have_key :weather
      expect(response[:daily].first[:weather]).to be_an Array
      expect(response[:daily].first[:weather].first).to have_key :description
      expect(response[:daily].first[:weather].first[:description]).to be_a String
      expect(response[:daily].first[:weather].first).to have_key :icon
      expect(response[:daily].first[:weather].first[:icon]).to be_a String

      expect(response).to have_key :hourly
      expect(response[:hourly]).to be_an Array
      expect(response[:hourly].first).to have_key :dt
      expect(response[:hourly].first[:dt]).to be_an Integer
      expect(response[:hourly].first).to have_key :temp
      expect(response[:hourly].first[:temp]).to be_a Float
      expect(response[:hourly].first).to have_key :weather
      expect(response[:hourly].first[:weather]).to be_an Array
      expect(response[:hourly].first[:weather].first).to have_key :description
      expect(response[:hourly].first[:weather].first[:description]).to be_a String
      expect(response[:hourly].first[:weather].first).to have_key :icon
      expect(response[:hourly].first[:weather].first[:icon]).to be_a String
    end
  end
end
