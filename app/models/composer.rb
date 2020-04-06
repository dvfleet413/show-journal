class Composer < ApplicationRecord
    has_many :shows
    has_many :genres, through: :shows
end
