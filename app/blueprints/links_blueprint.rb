class LinksBlueprint < Blueprinter::Base
  identifier :id
  fields :link, :link_name
  association :notes, blueprint: NotesBlueprint
end
