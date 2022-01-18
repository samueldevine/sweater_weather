# frozen_string_literal: true

module Api
  module V1
    class BooksForecastsController < ApplicationController
      def index
        data = BooksForecastsFacade.concat_books_and_forecast(params[:location], params[:quantity])

        render json: BookForecastSerializer.new(data)
      end
    end
  end
end
