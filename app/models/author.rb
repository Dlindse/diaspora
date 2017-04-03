class Author < ApplicationRecord
    has_many :works
    has_many :references, through: :works
    
    accepts_nested_attributes_for :works
    accepts_nested_attributes_for :references
end
