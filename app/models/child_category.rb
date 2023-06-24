class ChildCategory < ApplicationRecord
  belongs_to :parent_categories
  validates :title, presence: true
  has_many :notes
end
