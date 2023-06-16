Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # version 1
    # api/v1
    namespace :v1 do
      # api/v1/notes
      namespace :notes do
        # api/V1/notes/create, to: "notes#create"
        post :create
        # api/V1/notes/show, to: "notes#me"
        get :show
        # api/V1/notes/destroy, to: "notes#logout"
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
        # api/V1/images/destroy, to: "images#logout"
        delete :destroy
        # api/V1/notes/, to: "images#index"
        get :index
        # api/V1/images/, to: "images#update"
        put :update
      end
      namespace :links do
        # api/V1/links/create, to: "links#create"
        post :create
        # api/V1/links/show, to: "links#me"
        get :show
        # api/V1/links/destroy, to: "links#logout"
        delete :destroy
        # api/V1/notes/links, to: "links#index"
        get :index
        # api/V1/links/, to: "links#update"
        put :update
      end
    end
  end
end
