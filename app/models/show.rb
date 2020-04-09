class Show < ApplicationRecord
  belongs_to :composer
  belongs_to :genre
  has_many :viewings
  has_many :users, through: :viewings
  has_many :reviews, through: :viewings
  validates_presence_of :title, :first_performance_year

  accepts_nested_attributes_for :composer
  accepts_nested_attributes_for :genre

  scope :from_nineteenth_century, -> {where("first_performance_year >= ? AND first_performance_year < ?", 1800, 1900) }
  scope :from_twentieth_century, -> {where("first_performance_year >= ? AND first_performance_year < ?", 1900, 2000)}
  scope :from_twentyfirst_century, -> {where("first_performance_year >= ?", 2000)}
  scope :popular, -> { where("viewings_count >= ?", 0)}

  def composer_attributes=(composer)
    self.composer = Composer.find_or_create_by(name: composer[:name])
    self.composer.update(composer)
  end

  def genre_attributes=(genre)
    self.genre = Genre.find_or_create_by(name: genre[:name])
    self.genre.update(genre)
  end

#  idea for class level scoped 
#    def self.from_nineteenth_century
#      where("first_performance_year >= ? AND first_performance_year < ?", 1800, 1900)
#    end
#
#  I think it can also be written like this...
#
#    scope :from_ninteenth_century, -> { where("first_performance_year >= ? AND first_performance_year < ?", 1800, 1900) }
#
#  Show.from_nineteenth_century should return all shows first performed between 1800 and 1900
#  Can do the same with 20th and 21st centrury
end
