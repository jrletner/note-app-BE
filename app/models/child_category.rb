class ChildCategory < ApplicationRecord
  validates :title, presence: true

  belongs_to :parent_category, class_name: "ParentCategory", foreign_key: "parent_category_id"
  has_many :notes, dependent: :destroy
end
