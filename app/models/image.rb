class Image < ApplicationRecord
  belongs_to :notes
  validates :image_path, presence: true
  validates :link_name, presence: true
end
