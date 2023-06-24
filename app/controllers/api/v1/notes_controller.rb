module Api
  module V1
    class NotesController < Api::V1::ApplicationController
      def index
        notes = Note.all
        payload = {
          notes: NotesBlueprint.render_as_hash(notes),
        }
        render_success(payload: payload, status: 200)
      end

      def show
      end

      def destroy
      end

      def update
      end

      def create
        result = Api::Notes.new_note(params)
        render_error(errors: "Invalid Note", status: 400) and return unless result.success?
        payload = {
          note: NotesBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
      end
    end
  end
end
