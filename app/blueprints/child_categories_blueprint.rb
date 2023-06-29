class ChildCategoryBlueprint < Blueprinter::Base
    identifier :id
    fields :title
    association :user, blueprint: UserBlueprint
end