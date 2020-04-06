class Genre < ApplicationRecord
    has_many :shows
    has_many :composers, through: :shows
end
