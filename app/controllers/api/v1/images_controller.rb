module Api
  module V1
    class ImagesController < Api::V1::ApplicationController
      def index
        images = Image.all
        payload = {
          images: ImagesBlueprint.render_as_hash(images),
        }
        render_success(payload: payload, status: 200)
      end

      def show
        image = Image.find(params[:id])
        payload = {
          image: ImagesBlueprint.render_as_hash(image),
        }
        render_success(payload: payload, status: 200)
      end

      def destroy
        result = Api::Images.delete_image(params)
        render_error(errors: "There was an error deleting the image", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The image was successfully deleted",
          image: ImagesBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def update
        prev_image = Image.find(params[:id])
        result = Api::Images.update_image(params)
        render_error(errors: "There was an error updating the image", status: 400) and return unless result.success?
        previous_values = {
          id: prev_image[:id],
          image_path: prev_image[:image_path],
          link_name: prev_image[:link_name],
          notes_id: prev_image[:notes_id],
        }
        payload = {
          image: ImagesBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def create
        result = Api::Images.new_image(params)
        render_error(errors: "Invalid Image", status: 400) and return unless result.success?
        payload = {
          image: ImagesBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
      end
    end
  end
end
