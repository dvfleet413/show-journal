module ApplicationHelper
    def current_user
    #    !!session[:user_id] ? User.find(session[:user_id]) : nil  
        @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
