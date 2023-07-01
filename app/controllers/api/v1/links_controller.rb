module Api
  module V1
    class LinksController < Api::V1::ApplicationController
      def index
        links = Link.all
        payload = {
          links: LinksBlueprint.render_as_hash(links),
        }
        render_success(payload: payload, status: 200)
      end

      def show
        link = Link.find(params[:id])
        payload = {
          link: LinksBlueprint.render_as_hash(link),
        }
        render_success(payload: payload, status: 200)
      end

      def destroy
        result = Api::Links.delete_link(params)
        render_error(errors: "There was an error deleting the link", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The link was successfully deleted",
          link: LinksBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def update
        prev_link = Link.find(params[:id])
        result = Api::Links.update_link(params)
        render_error(errors: "There was an error updating the link", status: 400) and return unless result.success?
        previous_values = {
          id: prev_link[:id],
          link: prev_link[:link],
          link_name: prev_link[:link_name],
        }
        payload = {
          link: LinksBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def create
        result = Api::Links.new_link(params)
        render_error(errors: "Invalid Link", status: 400) and return unless result.success?
        payload = {
          link: LinksBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
      end
    end
  end
end
