class UserBlueprint < Blueprinter::Base 
    
    identifier :id 
    fields :email 

    view :normal do
        fields :email
    end
end