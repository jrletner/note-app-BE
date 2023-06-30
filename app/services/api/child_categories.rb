module Api
    module Child_Categories
        def self.new_child_category(params)
            child_category = ChildCategory.new(title: params[:title])

            begin
                child_category.save!
            rescue
                return ServiceContract.error("Error") unless child_category.vaild?
            end

            ServiceContract.success(child_category)
        end
    end
end