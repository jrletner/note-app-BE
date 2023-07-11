class ParentCategoriesBlueprint < Blueprinter::Base
  identifier :id
  fields :title
  association :user, blueprint: UserBlueprint
end
