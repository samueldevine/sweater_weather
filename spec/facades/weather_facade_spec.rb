# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '::get_weather_data' do
    it 'returns a Weather object', :vcr do
      lat = 39.738453
      long = -104.984853
      weather = WeatherFacade.get_weather_data(lat, long)

      expect(weather).to be_an_instance_of Weather
      expect(weather.current_weather).to be_a Hash
      expect(weather.daily_weather).to be_an Array
      expect(weather.daily_weather.length).to eq 5
      expect(weather.hourly_weather.length).to eq 8
    end
  end
end
