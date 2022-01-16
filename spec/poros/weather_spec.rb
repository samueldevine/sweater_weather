require 'rails_helper'

RSpec.describe Weather do
  describe '#initialize' do
    before :each do
      @weather = Weather.new({
        current: {
          dt: 1642359385,
          sunrise: 1642342720,
          sunset: 1642377624,
          temp: 50.44,
          feels_like: 45.16,
          humidity: 45.16,
          uvi: 0.64,
          visibility: 10000,
          weather: [{
            description: 'clear sky',
            icon: '01d'
          }]
        },
        daily: [{
          dt: 1642359385,
          sunrise: 1642342720,
          sunset: 1642377624,
          temp: {
            min: 28.98,
            max: 44.47
          },
          weather: [{
            description: 'clear sky',
            icon: '01d'
          }]
        }],
        hourly: [{
          dt: 1642356000,
          temp: 50.61,
          weather: [{
            description: 'clear sky',
            icon: '01d'
          }]
        }]
      })
    end

    it 'exists' do
      expect(@weather).to be_an_instance_of Weather
    end

    it 'has attributes that match the spec' do
      expect(@weather.current_weather).to be_a Hash
      expect(@weather.current_weather).to have_key :datetime
      expect(@weather.current_weather[:datetime]).to be_a String
      expect(@weather.current_weather).to have_key :sunrise
      expect(@weather.current_weather[:sunrise]).to be_a String
      expect(@weather.current_weather).to have_key :sunset
      expect(@weather.current_weather[:sunset]).to be_a String
      expect(@weather.current_weather).to have_key :temperature
      expect(@weather.current_weather).to have_key :feels_like
      expect(@weather.current_weather).to have_key :humidity
      expect(@weather.current_weather).to have_key :uvi
      expect(@weather.current_weather).to have_key :visibility
      expect(@weather.current_weather).to have_key :conditions
      expect(@weather.current_weather).to have_key :icon

      expect(@weather.daily_weather).to be_an Array
      expect(@weather.daily_weather.first).to be_a Hash
      expect(@weather.daily_weather.first).to have_key :date
      expect(@weather.daily_weather.first[:date]).to be_a String
      expect(@weather.daily_weather.first).to have_key :sunrise
      expect(@weather.daily_weather.first[:sunrise]).to be_a String
      expect(@weather.daily_weather.first).to have_key :sunset
      expect(@weather.daily_weather.first[:sunset]).to be_a String
      expect(@weather.daily_weather.first).to have_key :max_temp
      expect(@weather.daily_weather.first).to have_key :min_temp
      expect(@weather.daily_weather.first).to have_key :conditions
      expect(@weather.daily_weather.first).to have_key :icon

      expect(@weather.hourly_weather).to be_an Array
      expect(@weather.hourly_weather.first).to be_a Hash
      expect(@weather.hourly_weather.first).to have_key :time
      expect(@weather.hourly_weather.first[:time]).to be_a String
      expect(@weather.hourly_weather.first).to have_key :temperature
      expect(@weather.hourly_weather.first).to have_key :conditions
      expect(@weather.hourly_weather.first).to have_key :icon
    end
  end
end
