require 'rails_helper'

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