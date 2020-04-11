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
  scope :popular, -> {where("viewings_count >= ?", 5)}

  def composer_attributes=(composer)
    self.composer = Composer.find_or_create_by(name: composer[:name])
    self.composer.update(composer)
  end

  def genre_attributes=(genre)
    self.genre = Genre.find_or_create_by(name: genre[:name])
    self.genre.update(genre)
  end
end
