Rails.application.routes.draw do
    namespace :api, defaults: {format: :json} do
        namespace :v1 do
            namespace :child_categories do
                #api/V1/child_categories/create, to: "child_categories#create"
                post :create

                #api/V1/child_categories/show, to: "child_categories#show"
                get :show

                #api/V1/child_categories/destroy, to: "child_categories#destroy"
                delete :destroy

                #api/V1/child_categories/, to: "child_categories#index"
                put :index
            
                #api/V1/child_categories/update, to: "child_categories#update"
                put :update
            end
            namespace :parent_categories do
                #api/V1/parent_categories/create, to: "parent_categories#create"
                post :create

                #api/V1/parent_categories/show, to: "parent_categories#show"
                get :show
   
                #api/V1/parent_categories/destroy, to: "parent_categories#destroy"
                delete :destroy
   
                #api/V1/parent_categories/, to: "parent_categories#index"
                put :index
               
                #api/V1/parent_categories/update, to: "parent_categories#update"
                put :update
            end
        end
    end
end
