require 'rails_helper'

describe "Feature Test - Reviews", type: :feature do
    before(:each) do
        @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
        @genre = Genre.create(name: "Tragedy")
        @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
        @show_two = Show.create(title: "Falstaff", first_performance_year: 1893, composer_id: @composer.id, genre_id: @genre.id)
        @user = User.create(username: "Faker::Internet.username", email: Faker::Internet.email, password: "Password1")
        @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
        @viewing_two = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show_two.id)
        @review = Review.create(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
        @review_two = Review.create(body: "I liked it...", rating: 4, viewing_id: @viewing_two.id)

    end

    it "reviews#index page diplays user's reviews when params[:user_id]" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        visit user_reviews_path(@user)
        expect(page).to have_content("This show was awesome!")
        expect(page).to have_content("I liked it...")
    end

    it "reviews#index page diplays user's reviews when params[:show_id]" do
        visit show_reviews_path(@show)
        expect(page).to have_content("This show was awesome!")
        expect(page).to_not have_content("I liked it...")
    end





end