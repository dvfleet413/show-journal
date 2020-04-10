class SessionsController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        if !!auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.password = SecureRandom.hex(10)
              end
              session[:user_id] = @user.id
              redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:notice] = "Incorrect username or password, try again."
                render :new
            end
        end
    end

    def destroy 
        session.delete :user_id
        redirect_to root_path
    end
    
    private
        def auth
            request.env['omniauth.auth']
        end

end