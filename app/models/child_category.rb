class ChildCategory < ApplicationRecord
  belongs_to :parent_categories
  validates :title, presence: true
end
