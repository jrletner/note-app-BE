class ParentCategory < ApplicationRecord
  has_many :child_categories
  belongs_to :user
  validates :title, presence: true
end
