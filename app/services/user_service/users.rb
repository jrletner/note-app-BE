module UserService
    module Users
        def self.new_user(params)
            user = User.new(email: params[:email], password: params[:password])

            begin
                user.save! #user is valid
            rescue
                return ServiceContract.error("Error") unless user.valid? 
            end

            ServiceContract.success(user)
        end
    end
end