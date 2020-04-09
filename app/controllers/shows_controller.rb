class ShowsController < ApplicationController
    def new
        @show = Show.new
        @genre = @show.build_genre
        @composer = @show.build_composer
    end

    def create 
    end
    
    def index
        @genres = Genre.all
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
