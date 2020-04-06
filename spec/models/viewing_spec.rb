require 'rails_helper'

RSpec.describe Viewing, type: :model do
    describe "Validations" do
        before(:each) do 
            @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
            @genre = Genre.create(name: "Tragedy")
            @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
            @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
            @viewing = Viewing.new(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
        end

        it "is valid with a date, location, user_id, and show_id" do
            expect(@viewing).to be_valid
        end

        it "is not valid without a date, location, user_id, or show_id" do
            @timeless_viewing = Viewing.new(date: nil, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
            expect(@timeless_viewing).to_not be_valid
            @homeless_viewing = Viewing.new(date: Date.today, location: nil, user_id: @user.id, show_id: @show.id)
            expect(@homeless_viewing).to_not be_valid
            @userless_viewing = Viewing.new(date: Date.today, location: Faker::Address.city, user_id: nil, show_id: @show.id)
            expect(@userless_viewing).to_not be_valid
            @showless_viewing = Viewing.new(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: nil)
            expect(@showless_viewing).to_not be_valid 
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

        it "belongs_to a user" do
            expect(@viewing.user).to eq(@user)
        end

        it "belongs_to a show" do
            expect(@viewing.show).to eq(@show)
        end

        it "has_one review" do
            expect(@viewing.review).to eq(@review)
        end
    end
end
