class ApplicationController < ActionController::Base
    def current_user
        !!session[:user_id] ? User.find(session[:user_id]) : nil     
    end

    def login
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end
