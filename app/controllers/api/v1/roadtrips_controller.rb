# frozen_string_literal: true

module Api
  module V1
    class RoadtripsController < ApplicationController
      before_action :authenticate

      def create
        new_road_trip = RoadtripFacade.create_roadtrip(params[:origin], params[:destination])

        render json: RoadtripSerializer.new(new_road_trip)
      end

      private

      def authenticate
        unless User.where(api_key: params[:api_key]).any?
          render json: ErrorSerializer.serialize('Unauthorized'), status: 401
        end
      end
    end
  end
end
