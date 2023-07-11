module Api
  module V1
    class ParentCategoriesController < Api::V1::ApplicationController
      def index
        parent_categories = ParentCategory.all
        payload = {
          parent_categories: ParentCategoriesBlueprint.render_as_hash(parent_categories),
        }
        render_success(payload: payload, status: 200)
      end

      def show
        parent_category = ParentCategory.find(params[:id])
        payload = {
          parent_category: ParentCategoriesBlueprint.render_as_hash(parent_category),
        }
        render_success(payload: payload, status: 200)
      end

      def destroy
        result = Api::Parent_Categories.delete_parent(params)
        render_error(errors: "There was an error deleting the parent catagory", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The parent catagory was successfully deleted",
          note: ParentCategoriesBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def update
        prev_parent = ParentCategory.find(params[:id])
        result = Api::Parent_Categories.update_parent(params)
        render_error(errors: "There was an error updating the parent catagory", status: 400) and return unless result.success?
        previous_values = {
          id: prev_parent[:id],
          title: prev_parent[:title],
        }
        payload = {
          note: ParentCategoriesBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def create
        result = Api::ParentCategories.new_parent_category(params)
        render_error(errors: "Invalid Parent Category", status: 400) and return unless result.success?
        payload = {
          parent_category: ParentCategoriesBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
      end
    end
  end
end
