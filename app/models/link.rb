class Link < ApplicationRecord
  belongs_to :notes
  validates :link, presence: true
  validates :link_name, presence: true
end
