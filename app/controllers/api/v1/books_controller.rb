class Api::V1::BooksController < ApplicationController
  def index
    data = BookForecastFacade.concat_books_and_forecast(params[:location], params[:quantity])

    render json: BookForecastSerializer.new(data)
  end
end
