class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert_danger] = "Unabe to create your account. Please try again."
            redirect_to new_user_path
        end
    end

    def show
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end
