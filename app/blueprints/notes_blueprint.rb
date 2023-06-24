class NotesBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :description
  association :user, blueprint: UserBlueprint
end
