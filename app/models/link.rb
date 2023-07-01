class Link < ApplicationRecord
  belongs_to :notes, class_name: "Note", foreign_key: "notes_id"
  validates :link, presence: true
  validates :link_name, presence: true
end
