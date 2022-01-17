# frozen_string_literal: true

module Api
  module V1
    class RoadtripsController < ApplicationController
      before_action :authenticate

      def create
        new_road_trip = RoadtripFacade.create_roadtrip(params[:origin], params[:desitination])

        render json: RoadtripSerializer.new(new_road_trip)
      end

      private

      def road_trip_params
        params.permit(:origin, :desitination, :api_key)
      end

      def authenticate
        User.where(api_key: params[:api_key]).any?
      end
    end
  end
end
