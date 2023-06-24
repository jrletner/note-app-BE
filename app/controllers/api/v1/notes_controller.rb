module Api
  module V1
    class NotesController < Api::V1::ApplicationController
      def index
        notes = Note.all
        payload = {
          notes: notes,
        }
        render json: { success: true, payload: payload, status: 200 }, status: 200
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
