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
            @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
            @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
            @review = Review.create(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
          end
    
        it "belongs_to one composer" do 
            expect(@show.composer).to eq(@composer)
            expect(@show.composer).to_not eq(@composer_two)
        end

        it "belongs_to one genre" do
            expect(@show.genre).to eq(@genre)
            expect(@show.genre).to_not eq(@genre_two)
        end

        it "has_many viewings" do
            expect(@show.viewings).to include(@viewing)
        end

        it "has_many users through viewings" do
            expect(@show.users).to include(@user)
        end

        it "has_many reviews through viewings" do
            expect(@show.reviews).to include(@review)
        end
    end
end
