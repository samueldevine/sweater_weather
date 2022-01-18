class Api::V1::BooksForecastsController < ApplicationController
  def index
    data = BooksForecastsFacade.concat_books_and_forecast(params[:location], params[:quantity])

    render json: BookForecastSerializer.new(data)
  end
end
