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
        note = Note.find(params[:id])
        payload = {
          note: NotesBlueprint.render_as_hash(note),
        }
        render_success(payload: payload, status: 200)
      end

      def destroy
        result = Api::Notes.delete_note(params)
        render_error(errors: "There was an error deleting the note", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The note was successfully deleted",
          note: NotesBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def update
        prev_note = Note.find(params[:id])
        result = Api::Notes.update_note(params)
        render_error(errors: "There was an error updating the note", status: 400) and return unless result.success?
        previous_values = {
          id: prev_note[:id],
          title: prev_note[:title],
          description: prev_note[:description],
        }
        payload = {
          note: NotesBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
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
