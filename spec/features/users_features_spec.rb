require 'rails_helper'

describe "Feature Test - root", type: :feature do
    it "can navigate to root path" do
        visit root_path
        expect(current_path).to eq('/')
    end
end

describe "Feature Test - login", type: :feature do

    it "redirects to users#show on successful login" do
        visit login_path
        create_user
        user_login
        expect(current_path).to eq('/users/1')
        expect(page.get_rack_session_key('user_id')).to_not be_nil
    end

    it "redirects with flash login with incorrect password" do
        visit login_path
        create_user
        fill_in("user[username]", :with => "StatlerAndWaldorf")
        fill_in("user[password]", :with => "wrongpassword")
        click_button('Sign In')
        expect(current_path).to eq('/login')
        expect(page.get_rack_session).to_not include("user_id")
    end

    it "redirects to login page with flash message on unsuccesful login" do
        visit login_path
        # don't create user in order to fail login
        user_login
        expect(current_path).to eq('/login')
    end 
end

describe "Feature Test - Users", type: :feature do
    it "can create a new account with username, email, and password" do
       visit new_user_path
       user_signup
       expect(User.last.username).to eq("operaFan")
    end

    it "user is logged in and redirected to user#show page on account creation" do
        visit new_user_path
        user_signup
        expect(current_path).to eq('/users/1')
    end

    it "user#show page has link to view all shows user has seen" do 
        visit login_path
        create_user
        user_login
        expect(page).to have_link("Your Shows")

    end

    it "user#show page has link to view all shows in database" do
        visit login_path
        create_user
        user_login
        expect(page).to have_link("All Shows")
    end

    it "user#show page has a link to user's reviews" do
        visit login_path
        create_user
        user_login
        expect(page).to have_link("Your Reviews")
    end
end
