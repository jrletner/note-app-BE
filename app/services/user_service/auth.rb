module UserService
    module Auth
        def self.login(email, password, ip)
            user = User.find_by(email: email).try(:authenticate, password)
            return ServiceContract.error("User not found") if user.nil?
            return ServiceContract.error("Wrong Password") unless user
            token = user.generate_token!(ip)
            ServiceContract.success(user: user, token: token)
        end
    end
end