
module Api 
    module V1
        class UsersController < ApplicationController
           
            def create
                result = UserService::Users.new_user(params)
                render_error(errors: "Invalid User", status: 400) and return unless result.success?
                payload = {
                    user: UserBlueprint.render_as_hash(result.payload, view: :normal)
                  }
                render_success(payload: payload, status: 201)
            end

            def login
                result = UserService::Auth.login(params[:email], params[:password], @ip)
                render_error(errors: "Invalid User", status: 401) and return unless result.success?
                payload = {
                    user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
                    token: TokenBlueprint.render_as_hash(result.payload[:token]),
                    status: 200
                }
                render_success(payload: payload, status: 200)
            end

      
        end
    end

end
