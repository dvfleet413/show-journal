class Genre < ApplicationRecord
    has_many :shows
    has_many :composers, through: :shows
    validates :name, {presence: true, uniqueness: true}
end
