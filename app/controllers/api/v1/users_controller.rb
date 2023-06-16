\
module Api 
    module V1
        class UsersController < ApplicationController
           
            def create
                user = User.new(email: params[:email], password: params[:password])
               
                if user.save
                    render_success(payload: { user: UserBlueprint.render_as_hash(user, view: :normal) }, status: :created)
                  else
                    render_error(errors: "Invalid User", status: 400)
                  end
            end

      
        end
    end

end
