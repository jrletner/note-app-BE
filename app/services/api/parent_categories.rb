module Api
    module Parent_Categories
        def self.new_parent_category(params)
            parent_category = Parent_Category.new(title: params[:title])

            begin
                parent_category.save!
            rescue
                return ServiceContract.error("Error") unless parent_category.valid?
            end

            ServiceContract.success(parent_category)
        end

        def self.delete_parent(params)
            parent = Parent_Categories.find_by(id: params[:id])
      
            return ServiceContract.error("Parent catagory not found") unless parent
      
            if parent.destroy
              ServiceContract.success(parent)
            else
              ServiceContract.error("Failed to delete parent category")
            end
        end

        def self.update_parent(params)
            parent = Parent_Categories.find_by(id: params[:id])
      
            return ServiceContract.error("Parent catagory not found") unless parent
      
            if parent.update(title: params[:title])
              ServiceContract.success(parent)
            else
              ServiceContract.error("Failed to update parent category")
            end
          end
    end
end