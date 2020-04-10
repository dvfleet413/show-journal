class SessionsController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        binding.pry
        if auth['uid']
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
              end
        else
            @user = User.find_by(username: params[:user][:username])
        end
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Incorrect username or password, try again."
            render :new
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