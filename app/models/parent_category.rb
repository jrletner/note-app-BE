class ParentCategory < ApplicationRecord
    has_many :child_categories
    
    validates :title, presence: true

end
