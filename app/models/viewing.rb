class Viewing < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates_presence_of :date, :location, :user_id, :show_id
end
