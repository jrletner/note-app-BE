Rails.application.routes.draw do
     namespace :api, default: { format: :json } do
        namespace :v1 do
           namespace :users do
            post :login
            post :create 
            get :me 
            delete :logout
           end
        end
     end
end
