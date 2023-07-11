class ChildCategoriesBlueprint < Blueprinter::Base
  identifier :id
  fields :title
  association :parent_category, blueprint: ParentCategoriesBlueprint
end
