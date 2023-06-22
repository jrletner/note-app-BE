class UserBlueprint < Blueprinter::Base 
    
    identifier :id 
    fields :email 

    view :normal do
        fields :email
    end

    view :login do
        association :token, blueprint: TokenBlueprint do |user, _options|
          user.tokens.last
        end
      end
end