Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  namespace :api, defaults: { format: :json } do
    # version 1
    # api/v1
    namespace :v1 do
      # api/v1/users
      namespace :users do
        # api/V1/users/index, to: "users#index"
        get :index
        # api/V1/users/login, to: "users#login"
        post :login
        # api/V1/users/create, to: "users#create"
        post :create
        # api/V1/users/me, to: "users#me"
        get :me
        # api/V1/users/logout, to: "users#logout"
        delete :logout
      end
      # api/v1/notes
      namespace :notes do
        # api/V1/notes/create, to: "notes#create"
        post :create
        # api/V1/notes/show, to: "notes#me"
        get :show
        # api/V1/notes/destroy, to: "notes#destroy"
        delete :destroy
        # api/V1/notes/, to: "notes#index"
        get :index
        # api/V1/notes/, to: "notes#update"
        put :update
      end
      namespace :images do
        # api/V1/images/create, to: "images#create"
        post :create
        # api/V1/images/show, to: "images#me"
        get :show
        # api/V1/images/destroy, to: "images#destroy"
        delete :destroy
        # api/V1/images/index, to: "images#index"
        get :index
        # api/V1/images/update, to: "images#update"
        put :update
      end
      namespace :links do
        # api/V1/links/create, to: "links#create"
        post :create
        # api/V1/links/show, to: "links#me"
        get :show
        # api/V1/links/destroy, to: "links#destroy"
        delete :destroy
        # api/V1/links/index, to: "links#index"
        get :index
        # api/V1/links/update, to: "links#update"
        put :update
      end
      namespace :child_categories do
        #api/V1/child_categories/index, to: "child_categories#index"
        get :index
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
        #api/V1/parent_categories/index, to: "parent_categories#index"
        get :index
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
