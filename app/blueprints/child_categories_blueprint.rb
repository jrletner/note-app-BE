class ChildCategoryBlueprint < Blueprinter::Base
    identifier :id
    fields :title
    association :parent_category, blueprint: ParentCategoryBlueprint
end