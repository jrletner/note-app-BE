module Api
  module ChildCategories
    def self.new_child_category(params)
      child_category = ChildCategory.new(title: params[:title], parent_category_id: params[:parent_category_id])

      begin
        child_category.save!
      rescue
        return ServiceContract.error("Error") unless child_category.valid?
      end

      ServiceContract.success(child_category)
    end

    def self.delete_child(params)
      child = ChildCategory.find_by(id: params[:id])

      return ServiceContract.error("Child catagory not found") unless child

      if child.destroy
        ServiceContract.success(child)
      else
        ServiceContract.error("Failed to delete child category")
      end
    end
    def self.update_child(params)
      child = ChildCategory.find_by(id: params[:id])

      return ServiceContract.error("Child Catagory not found") unless child

      if child.update(title: params[:title])
        ServiceContract.success(child)
      else
        ServiceContract.error("Failed to update child category")
      end
    end
  end
end
