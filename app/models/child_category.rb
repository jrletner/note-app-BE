class ChildCategory < ApplicationRecord
    belongs_to :parent_category
    has_many :notes
    
    validates :title, presence: true
end
