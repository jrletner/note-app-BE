class NotesBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :description
  association :user, blueprint: UserBlueprint
  association :child_category, blueprint: ChildCategoriesBlueprint
  association :image, blueprint: ImagesBlueprint
  association :link, blueprint: LinksBlueprint
end
