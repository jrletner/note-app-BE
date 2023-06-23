class ParentCategory < ApplicationRecord
    belongs_to :user
    has_many :child_categories
    
    validates :title, presence: true

end
