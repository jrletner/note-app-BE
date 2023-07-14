class Link < ApplicationRecord
  belongs_to :note, class_name: "Note", foreign_key: "note_id"
  validates :link, presence: true
  validates :link_name, presence: true
end
