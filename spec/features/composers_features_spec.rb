require 'rails_helper'

describe "Feature Test - Composers", type: :feature do
    it "composer#index page lists all composers with link to their #show page" do
        visit composers_path
        expect(page).to have_link("Giuseppe Verdi")
    end

    it "composers#show page lists all shows by composer with links to shows#show page" do
        @composer = Composer.first
        visit composer_path(@composer)
        expect(page).to have_link("Don Carlo")
    end
end