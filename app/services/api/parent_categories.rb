module Api
  module ParentCategories
    def self.new_parent_category(params)
      parent_category = ParentCategory.new(title: params[:title], user_id: params[:user_id])

      begin
        parent_category.save!
      rescue
        return ServiceContract.error("Error") unless parent_category.valid?
      end

      ServiceContract.success(parent_category)
    end

    def self.delete_parent(params)
      parent = ParentCategory.find_by(id: params[:id])

      return ServiceContract.error("Parent catagory not found") unless parent

      if parent.destroy
        ServiceContract.success(parent)
      else
        ServiceContract.error("Failed to delete parent category")
      end
    end

    def self.update_parent(params)
      parent = ParentCategory.find_by(id: params[:id])

      return ServiceContract.error("Parent catagory not found") unless parent

      if parent.update(title: params[:title])
        ServiceContract.success(parent)
      else
        ServiceContract.error("Failed to update parent category")
      end
    end
  end
end
