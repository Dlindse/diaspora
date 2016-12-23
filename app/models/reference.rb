class Reference < ApplicationRecord
  belongs_to :work
  belongs_to :genre
  has_many :influences
end
