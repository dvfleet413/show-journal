require 'rails_helper'

describe "Feature Test - Composers", type: :feature do
    before(:each) do
        @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
        @genre = Genre.create(name: "Tragedy")
        @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
        @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
        @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
        @review = Review.create(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
    end

    it "composer#index page lists all composers with link to their #show page" do
        visit composers_path
        expect(page).to have_link("Giuseppe Verdi")
    end

    it "composers#show page lists all shows by composer with links to shows#show page" do
        visit composer_path(@composer)
        expect(page).to have_link("Don Carlo")
    end
end