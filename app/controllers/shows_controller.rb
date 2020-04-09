class ShowsController < ApplicationController
    def new
        @show = Show.new
        @shows = Show.all
        @genre = @show.build_genre
        @genres = Genre.all
        @composer = @show.build_composer
        @composers = Composer.all
    end

    def create 
        @show = Show.create!(shows_params)
        redirect_to shows_path
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

        def shows_params
            params.require(:show).permit(:title, :first_performance_year, 
                                        composer_attributes: [:name, :birth_year, :death_year, :country],
                                        genre_attributes: [:name])
        end
end
