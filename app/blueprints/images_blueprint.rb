class ImagesBlueprint < Blueprinter::Base
  identifier :id
  fields :image_path, :link_name
  association :notes, blueprint: NotesBlueprint
end
