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
    end
end