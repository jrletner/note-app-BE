module Api
  module V1
    class ChildCategoriesController < Api::V1::ApplicationController
      def index
        child_categories = ChildCategory.all
        payload = {
          child_categories: ChildCategoriesBlueprint.render_as_hash(child_categories),
        }
        render_success(payload: payload, status: 200)
      end

      def show
        child_category = ChildCategory.find(params[:id])
        payload = {
          child_category: ChildCategoriesBlueprint.render_as_hash(child_category),
        }
        render_success(payload: payload, status: 200)
      end

      def destroy
        result = Api::ChildCategories.delete_child(params)
        render_error(errors: "There was an error deleting the child catagory", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The child catagory was successfully deleted",
          note: ChildCategoriesBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def update
        prev_child = ChildCategory.find(params[:id])
        result = Api::ChildCategories.update_child(params)
        render_error(errors: "There was an error updating the child catagory", status: 400) and return unless result.success?
        previous_values = {
          id: prev_child[:id],
          title: prev_child[:title],
        }
        payload = {
          note: ChildCategoriesBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def create
        result = Api::ChildCategories.new_child_category(params)
        render_error(errors: "Invalid Child Category", status: 400) and return unless result.success?
        payload = {
          child_category: ChildCategoriesBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload, status: 201)
      end
    end
  end
end
