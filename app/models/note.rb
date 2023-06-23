class Note < ApplicationRecord
  belongs_to :user
  belongs_to :child_categories
  has_many :links
  has_many :images
end
