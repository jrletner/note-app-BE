module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def index
        render json: { message: "this is right", status: 200 }
      end
    end
  end
end
