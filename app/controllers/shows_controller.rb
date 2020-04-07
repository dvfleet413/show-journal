class ShowsController < ApplicationController
    def index
        if params[:user_id]
            @shows = current_user.shows
            render 'user_shows_index'
        else
            @shows = Show.all
        end
    end

    def show
        set_show
    end


    private
        def set_show
            @show = Show.find(params[:id])
        end
end
