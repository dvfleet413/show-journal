require 'rails_helper'

describe "Feature Test - Shows", type: :feature do
    before(:each) do
        @composer = Composer.create(name: "Giuseppe Verdi", birth_year: 1813, death_year: 1901, country: "Italy")
        @genre = Genre.create(name: "Tragedy")
        @show = Show.create(title: "Don Carlo", first_performance_year: 1876, composer_id: @composer.id, genre_id: @genre.id)
        @show_two = Show.create(title: "Falstaff", first_performance_year: 1893, composer_id: @composer.id, genre_id: @genre.id)
        @user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: "Password1")
        @viewing = Viewing.create(date: Date.today, location: Faker::Address.city, user_id: @user.id, show_id: @show.id)
        @review = Review.create(body: "This show was awesome!", rating: 5, viewing_id: @viewing.id)
    end

    it "show#index page links to all shows when no params[:user_id]" do
        visit shows_path
        expect(page).to have_link("Don Carlo")
        expect(page).to have_link("Falstaff")
    end

    it "show#index page lists only links to shows a user has seen when params[:user_id]" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        expect(page).to have_link("Don Carlo")
        expect(page).to_not have_content("Falstaff")
    end

    it "shows#show page lists composer, first performance year, and all reviews for the show" do
        visit show_path(@show)
        expect(page).to have_content("Don Carlo")
        expect(page).to have_content("1876")
        expect(page).to have_content("This show was awesome!")
    end

    it "shows#show page has links to composer and reviews" do
        visit show_path(@show)
        expect(page).to have_link("Giuseppe Verdi")
        expect(page).to have_link("Reviews", href: '/shows/1/reviews')
    end
end

describe "Feature Test - Create New Viewing", type: :feature do
    it "user can click button on show#show page to see nested form to create new viewing and review" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        visit show_path(@show)
        expect(page).to have_button("I Saw This!")
    end

    it "submiting new viewing/review form creates a new viewing and review, with all approproate associations" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        visit show_path(@show)
        click_button("I Saw This!")
        # fill in form and expect @user.shows to include @show, expect @show.reviews to include new review
        expect(true).to eq(false)
    end
end

describe "Feature Test - Create New Show", type: :feature do
    it "user can click link on show#index page to see nested form to create new show, composer, and genre" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        visit show_path(@show)
        expect(page).to have_button("Add New Show")
    end

    it "submitting new show/composer/genre form creates a new show, composer, and genre, with all appropriate associations" do
        visit login_path
        fill_in("user[username]", :with => @user.username)
        fill_in("user[password]", :with => "Password1")
        click_button('Sign In')
        visit show_path(@show)
        click_button("Add New Show")
        #fill in form and expect Show.last to eq new show, Composer.last to equal new composer, and Genre.last to equal new genre
        expect(true).to eq(false)
    end
end