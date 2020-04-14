class Viewing < ApplicationRecord
  belongs_to :user
  belongs_to :show, counter_cache: true
  has_one :review, dependent: :destroy
  validates_presence_of :date, :location, :user_id, :show_id
  accepts_nested_attributes_for :review, allow_destroy: true
end
