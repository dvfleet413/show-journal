class Viewing < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_one :review
  validates_presence_of :date, :location, :user_id, :show_id
  accepts_nested_attributes_for :review
end
