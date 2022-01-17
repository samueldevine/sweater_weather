# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
          render json: UserSerializer.new(user)
        else
          render json: ErrorSerializer.serialize('Incorrect username or password'), status: 403
        end
      end
    end
  end
end
