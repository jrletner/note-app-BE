module Api
  module V1
    class NotesController < Api::V1::ApplicationController
      def index
        render json: { message: "this is right", status: 200 }
      end

      def show
      end

      def destroy
      end

      def update
      end

      def create
      end
    end
  end
end
