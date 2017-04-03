class Work < ApplicationRecord
  belongs_to :author
  has_many :references
  
  
  accepts_nested_attributes_for :references
end
