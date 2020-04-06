class Composer < ApplicationRecord
    has_many :shows
    has_many :genres, through: :shows
    validates :name, :birth_year, :country, presence: true
    validates :name, uniqueness: true
end
