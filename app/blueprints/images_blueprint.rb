class ImagesBlueprint < Blueprinter::Base
  identifier :id
  fields :image_path, :link_name
  # association :note, blueprint: NotesBlueprint
end
