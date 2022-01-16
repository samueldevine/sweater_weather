class Api::V1::ForecastsController < ApplicationController
  def show
    lat_long = GeocodeFacade.get_lat_long(params[:location])
    forecast = WeatherFacade.get_weather_data(lat_long[:lat], lat_long[:lng])

    render json: WeatherSerializer.new(forecast)
  end
end
