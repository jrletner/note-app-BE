module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate, only: [:create, :login]

      def create
        result = UserService::Users.new_user(params)
        render_error(errors: "Invalid User", status: 400) and return unless result.success?
        payload = {
          user: UserBlueprint.render_as_hash(result.payload, view: :normal),
        }
        render_success(payload: payload, status: 201)
      end

      def login
        result = UserService::Auth.login(params[:email], params[:password], @ip)
        render_error(errors: "Invalid User", status: 401) and return unless result.success?
        payload = {
          user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
          #Don't need this here since we are calling the TokenBlueprint from the :login def in the UserBlueprint
          #token: TokenBlueprint.render_as_hash(result.payload[:token]),
          status: 200,
        }
        render_success(payload: payload, status: 200)
      end

      def me
        render_success(payload: UserBlueprint.render_as_hash(@current_user), status: 200)
      end

      def logout
        result = UserService::Auth.logout(@current_user, @token)
        render_error(errors: "Error Logging Out", status: 401) and return unless result.success?
        render_success(payload: "Logout Successful", status: 200)
      end
    end
  end
end
