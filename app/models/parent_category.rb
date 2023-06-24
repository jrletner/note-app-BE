class ParentCategory < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :child_categories, dependent: :destroy
end
