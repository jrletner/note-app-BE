class Image < ApplicationRecord
  belongs_to :note, class_name: "Note", foreign_key: "note_id"
  validates :image_path, presence: true
  validates :link_name, presence: true
end
