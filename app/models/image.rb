class Image < ApplicationRecord
  belongs_to :notes, class_name: "Note", foreign_key: "notes_id"
  validates :image_path, presence: true
  validates :link_name, presence: true
end
