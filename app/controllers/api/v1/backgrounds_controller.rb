# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def show
        render json: PhotoSerializer.new(PhotoFacade.get_background(params[:location]))
      end
    end
  end
end
