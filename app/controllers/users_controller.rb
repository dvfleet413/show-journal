class UsersController < ApplicationController
    def get_login
        @user = User.new 
        render 'login'
    end

    def post_login
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Incorrect username or password, try again."
        end
    end

    def new 
        @user = User.new
    end

    def show
    end


    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end
