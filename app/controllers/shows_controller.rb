class ShowsController < ApplicationController
    def index
        if params[:user_id]
            @shows = current_user.shows
            render 'user_shows_index'
        else
            @shows = Show.all
        end
    end
end
