class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def login
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def redirect_if_not_authorized
        if !logged_in?
            flash[:alert_warning] = "You must be logged in to view that page."
            redirect_to login_path
        end
    end

end
