class LinksBlueprint < Blueprinter::Base
  identifier :id
  fields :link, :link_name
  #association :note, blueprint: NotesBlueprint
end
