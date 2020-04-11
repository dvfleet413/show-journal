class ApplicationController < ActionController::Base
    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def login
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end
