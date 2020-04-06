class Review < ApplicationRecord
  belongs_to :viewing
  validates_presence_of :body, :rating, :viewing_id
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5} 
end
