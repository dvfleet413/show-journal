require 'rails_helper'

RSpec.describe Show, type: :model do
    describe "Validations" do
        before(:each) do
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @genre = Genre.create(name: "Tragedy")
            @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
        end

        it "is valid with a title, first_performance_year, composer_id, and genre_id" do
            expect(@show).to be_valid
        end

        it "is not valid without a title, first_performance_year, composer_id, or genre_id" do
            @titleless_show = Show.new(title: nil, first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
            expect(@titleless_show).to_not be_valid
            @performanceless_show = Show.new(title: "Don Carlo", first_performance_year: nil, composer_id: @composer.id, genre_id: @genre.id)
            expect(@performanceless_show).to_not be_valid
            @composerless_show = Show.new(title: "Don Carlo", first_performance_year: 1876, composer_id: nil, genre_id: @genre.id)
            expect(@composerless_show).to_not be_valid
            @genreless_show = Show.new(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: nil)
            expect(@genreless_show).to_not be_valid
        end
    end

    describe "Associations" do
        before(:each) do 
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @composer_two = Composer.create(name: "Giacomo Puccini", birth_year: 1858, death_year: 1924, country: "Italy")
            @genre = Genre.create(name: "Tragedy")
            @genre_two = Genre.create(name: "Comedy")
            @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
          end
        


    end
end
