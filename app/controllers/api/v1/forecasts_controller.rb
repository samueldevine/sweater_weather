class Api::V1::ForecastsController < ApplicationController
  def show
    lat_lng = GeocodeFacade.get_lat_long(params[:location])
  end
end
