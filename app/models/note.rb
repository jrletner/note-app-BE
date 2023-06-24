class Note < ApplicationRecord
  belongs_to :user
  belongs_to :child_category
  has_many :images, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
