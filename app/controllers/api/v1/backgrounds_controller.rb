class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: PhotoSerializer.new(PhotoFacade.get_background(params[:location]))
  end
end
