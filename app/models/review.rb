class Review < ApplicationRecord
  belongs_to :viewing
  has_one :user, through: :viewing
  has_one :show, through: :viewing
  validates_presence_of :body, :rating, :viewing_id
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5} 
end
