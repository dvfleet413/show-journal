require 'rails_helper'

RSpec.describe User, type: :model do
    describe "Validations" do
        before(:each) do
            user = {username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password}
            @user = User.create(user)
        end

        it "is valid with a username, email, and password" do 
            expect(@user).to be_valid
        end

        it "is not valid without username, email, or password" do
            @nameless_user = User.new(username: nil, email: Faker::Internet.email, password: Faker::Internet.password)
            expect(@nameless_user).to_not be_valid
            @lowtech_user = User.new(username: Faker::Internet.username, email: nil, password: Faker::Internet.password)
            expect(@lowtech_user).to_not be_valid
            @insecure_user = User.new(username: Faker::Internet.username, email: Faker::Internet.email, password: nil)
            expect(@insecure_user).to_not be_valid
        end 

        it "is not valid with a non-unique username" do
            @user_one = User.create(username: "doubletrouble", email: Faker::Internet.email, password: Faker::Internet.password)
            @user_two = @user_one = User.new(username: "doubletrouble", email: Faker::Internet.email, password: Faker::Internet.password)
            expect(@user_two).to_not be_valid
        end

        it "is not valid with a non-unique email" do
            @user_one = User.create(username: Faker::Internet.username, email: "double@trouble.com", password: Faker::Internet.password)
            @user_two = User.new(username: Faker::Internet.username, email: "double@trouble.com", password: Faker::Internet.password)
            expect(@user_two).to_not be_valid
        end

    end

    describe "Associations" do




    end
end
