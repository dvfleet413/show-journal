class Show < ApplicationRecord
  belongs_to :composer
  belongs_to :genre
  validates :title, :first_performance_year, presence: true
end
