require 'rails_helper'

describe "Feature Test - root", type: :feature do
    it "can navigate to root path" do
        visit root_path
        expect(current_path).to eq('/')
        expect(true).to eq(false)
    end
end

describe "Feature Test - login", type: :feature do
    it "can login as a user" do
        expect(true).to eq(false)
    end

    it "redirects to users#show on successful login" do
        expect(true).to eq(false)
    end

    it "redirects to login page with flash message on unsuccesful login" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Users", type: :feature do
    it "can create a new account with username, email, and password" do
        expect(true).to eq(false)
    end

    it "user is logged in and redirected to user#show page on account creation" do
        expect(true).to eq(false)
    end

    it "user#show page has link to view all shows user has seen" do 
        expect(true).to eq(false)
    end

    it "user#show page has link to view all shows in database" do
        expect(true).to eq(false)
    end

    it "user#show page has a link to user's reviews" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Shows", type: :feature do
    it "show#index page lists all shows when no params[:user_id]" do
        expect(true).to eq(false)
    end

    it "show#index page lists only shows a user has seen when params[:user_id]" do
        expect(true).to eq(false)
    end

    it "show#index has links to each show's show page" do
        expect(true).to eq(false)
    end

    it "shows#show page lists composer, first performance year, and all reviews for the show" do
        expect(true).to eq(false) 
    end

    it "shows#show page has links to composer and reviews" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Composers", type: :feature do
    it "composer#index page lists all composers with link to their #show page" do
        expect(true).to eq(false)
    end

    it "composers#show page lists all shows by composer with links to shows#show page" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Genre" do
    it "genre#index page shows all genres, with link to their show page" do
        expect(true).to eq(false)
    end

    it "genre#show page lists all shows in that genre with links to their show page" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Create New Viewing", type: :feature do
    it "user can click button on show#show page to see nested form to create new viewing and review" do
        expect(true).to eq(false)
    end

    it "submiting new viewing/review form creates a new viewing and review, with all approproate associations" do
        expect(true).to eq(false)
    end
end

describe "Feature Test - Create New Show", type: :feature do
    it "user can click link on show#index page to see nested form to create new show, composer, and genre" do
        expect(true).to eq(false)
    end

    it "submitting new show/composer/genre form creates a new show, composer, and genre, with all appropriate associations" do
        expect(true).to eq(false)
    end
end
