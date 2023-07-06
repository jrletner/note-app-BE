module Api
  module V1
    class ParentCategoriesController < Api::V1::ApplicationController
      def index
        parent_categories = ParentCategory.all
        payload = {
          parent_categories: ParentCategoryBlueprint.render_as_hash(parent_categories),
        }
        render_success(payload, status: 200)
      end

      def show
        parent_category = ParentCategory.find(params[:id])
        payload = {
          parent_category: ParentCategoryBlueprint.render_as_hash(parent_category),
        }
        render_success(payload, status: 200)
      end

      def destroy
      end

      def update
      end

      def create
        result = Api::Parent_Categories.new_parent_category(params)
        render_error(errors: "Invalid Parent Category", status: 400) and return unless result.success?
        payload = {
          parent_category: ParentCategoryBlueprint.render_as_hash(parent_category),
        }
      end
    end
  end
end
