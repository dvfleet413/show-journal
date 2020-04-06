class Show < ApplicationRecord
  belongs_to :composer
  belongs_to :genre
  validates_presence_of :title, :first_performance_year
end
