# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include ErrorSerializer

      def create
        user = user_params
        user[:email] = user[:email].downcase
        new_user = User.new(user)

        if new_user.save
          render json: UserSerializer.new(new_user), status: 201
        else
          render json: ErrorSerializer.serialize(new_user.errors.full_messages), status: 400
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
