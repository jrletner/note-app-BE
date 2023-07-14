class Note < ApplicationRecord
  belongs_to :user
  belongs_to :child_category
  has_many :image, dependent: :destroy
  has_many :link, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
