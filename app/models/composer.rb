class Composer < ApplicationRecord
    has_many :shows
    has_many :genres, through: :shows
    validates_presence_of :name, :birth_year, :country
    validates_uniqueness_of :name
end
