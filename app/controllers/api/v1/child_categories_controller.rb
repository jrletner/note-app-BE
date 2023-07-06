module Api
  module V1
    class ChildCategoriesController < Api::V1::ApplicationController
      def index
        child_categories = ChildCategory.all
        payload = {
          child_categories: ChildCategoryBlueprint.render_as_hash(child_categories),
        }
        render_success(payload, status: 200)
      end

      def show
        child_category = ChildCategory.find(params[:id])
        payload = {
          child_category: ChildCategoryBlueprint.render_as_hash(child_category),
        }
        render_success(payload, status: 200)
      end

      def destroy
      end

      def update
      end

      def create
        result = Api::Child_Categories.new_child_category(params)
        render_error(errors: "Invalid Child Category", status: 400) and return unless result.success?
        payload = {
          child_category: ChildCategoryBlueprint.render_as_hash(child_category),
        }
      end
    end
  end
end
