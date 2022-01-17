# frozen_string_literal: true

module Api
  module V1
    class ForecastsController < ApplicationController
      def show
        coordinates = MapFacade.get_coordinates(params[:location])
        forecast = WeatherFacade.get_weather_data(coordinates[:lat], coordinates[:lng])

        render json: WeatherSerializer.new(forecast)
      end
    end
  end
end
