module LoginHelper
    def user_signup
        fill_in("user[username]", :with => "operaFan")
        fill_in("user[email]", :with => "operafan@opera.com")
        fill_in("user[password]", :with => "Password1")
        fill_in("user[password_confirmation]", :with => "Password1")
        click_button('Create Account')

    end

    def user_login
        fill_in("user[username]", :with => "StatlerAndWaldorf")
        fill_in("user[password]", :with => "thisShowStinks")
        click_button('Sign In')
    end

    def create_user
        @user= User.create(username: "StatlerAndWaldorf", email: "hecklers@muppets.email", password: "thisShowStinks")
    end
end