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
        if params[:user_id]
            @shows = current_user.shows
            render 'user_shows_index'
        elsif params[:filter] == "popular"
            @shows = Show.popular
        elsif params[:filter] == "from-nineteenth-century"
            @shows = Show.from_nineteenth_century
        elsif params[:filter] == "from-twentieth-century"
            @shows = Show.from_twentieth_century
        elsif params[:filter] == "from-twentyfirst-century"
            @shows = Show.from_twentyfirst_century
        elsif params[:filter] == "all" || !params[:filter]
            @shows = Show.all
        end
        @genres = @shows.collect {|show| show.genre}.uniq
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
