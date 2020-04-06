require 'rails_helper'

RSpec.describe Review, type: :model do
    describe "Validations" do
        before(:each) do
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @genre = Genre.create(name: "Tragedy")
            @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
            @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
            @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
            @review = Review.new(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
        end

        it "is valid with a body, rating, and viewing_id" do
            expect(@review).to be_valid
        end

        it "is not valid without body, rating, or viewing_id" do
            @blank_review = Review.new(body: nil, rating: 5, viewing_id: @viewing.id)
            expect(@blank_review).to_not be_valid 
            @ratingless_review = Review.new(body: "This show was awesome!", rating: nil, viewing_id: @viewing.id)
            expect(@ratingless_review).to_not be_valid
            @viewless_review = Review.new(body: "This show was awesome!", rating: 5, viewing_id: nil)
            expect(@viewless_review).to_not be_valid
        end

        it "is not valid with a rating less than 1 or greater than 5" do
            @too_high_review = Review.new(body: "This show was too awesome!", rating: 10, viewing_id: @viewing.id)
            expect(@too_high_review).to_not be_valid
            @too_low_review = Review.new(body: "This show was aweful!", rating: 0, viewing_id: @viewing.id)
            expect(@too_low_review).to_not be_valid
        end
    end

    describe "Associations" do
        before(:each) do
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @genre = Genre.create(name: "Tragedy")
            @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
            @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
            @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
            @review = Review.create(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
        end

        it "belongs_to a viewing" do
            expect(@review.viewing).to eq(@viewing)
        end

        it "has_one user through a viewing" do
            expect(@review.user).to eq(@user)
        end

        it "has_one show through a viewing" do
            expect(@review.show).to eq(@show)
        end


    end

end
