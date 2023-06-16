module Api
  module V1
    class NotesController < Api::V1::ApplicationController
      def index
        render json: { message: "this is right", status: 200 }
      end

      def show
        render json: { message: "this is right", status: 200 }
      end

      def destroy
        render json: { message: "this is right", status: 200 }
      end

      def update
        render json: { message: "this is right", status: 200 }
      end
    end
  end
end
