require 'rails_helper'

RSpec.describe Composer, type: :model do
  describe "Validations" do 
    before(:each) do
      @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
    end

    it "is valid with a name, birth_year, death_year, and country" do
      expect(@composer).to be_valid
    end

    it "is not valid without name, birth_year, or country" do
      @nameless_composer = Composer.create(
        birth_year: 1813,
        death_year: 1901,
        country: "Italy"
      )
      expect(@nameless_composer).to_not be_valid

      @birthless_composer = Composer.create(
        name: "Giuseppe Verdi",
        death_year: 1901,
        country: "Italy"
      )
      expect(@birthless_composer).to_not be_valid

      @homeless_composer = Composer.create(
        name: "Giuseppe Verdi",
        birth_year: 1813,
        death_year: 1901
      )
      expect(@homeless_composer).to_not be_valid
    end

    it "is not valid with a non-unique name" do
      @composer_two = Composer.new(
        name: "Giuseppe Verdi",
        birth_year: 1812,
        death_year: 1900,
        country: "Italia"
      )
      expect(@composer_two).to_not be_valid
    end
  end

  describe "Associations" do
    before(:each) do 
      @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
      @genre = Genre.create(name: "Tragedy")
      @genre_two = Genre.create(name: "Comedy")
      @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
      @show_two = Show.create(title: "Falstaff", first_performance_year: 1893, composer_id: @composer.id, genre_id: @genre_two.id)
    end

    it "has_many shows" do
      expect(@composer.shows).to include(@show)
      expect(@composer.shows).to include(@show_two)
    end

    it "has_many genres through shows" do
      expect(@composer.genres).to include(@genre)
      expect(@composer.genres).to include(@genre_two)
    end

  end
end
