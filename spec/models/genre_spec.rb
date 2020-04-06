require 'rails_helper'

RSpec.describe Genre, type: :model do
    describe "Validations" do

        it "is valid with a name" do
            @genre = Genre.new(name: "Opera - Tragedy")
            expect(@genre).to be_valid
        end

        it "is not valid without a name" do
            @genre = Genre.new(name: nil)
            expect(@genre).to_not be_valid 
        end
    end

    describe "Associations" do
        before(:each) do 
            @genre = Genre.create(name: "Comedy")
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @composer_two = Composer.create(name: "Giacomo Puccini", birth_year: 1858, death_year: 1924, country: "Italy")
            @show = Show.create(title: "Falstaff", first_performance_year: 1893, composer_id: @composer.id, genre_id: @genre.id)
            @show_two = Show.create(title: "La fanciulla del West", first_performance_year: 1910, composer_id: @composer_two.id, genre_id: @genre.id)
        end

        it "has_many shows" do
            expect(@genre.shows).to include(@show)
            expect(@genre.shows).to include(@show_two)
        end

        it "has_many composers through shows" do
            expect(@genre.composers).to include(@composer)
            expect(@genre.composers).to include(@composer_two)
        end
    end
end
