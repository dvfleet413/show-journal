class ShowsController < ApplicationController

# overuse of .all to render Shows#new -> use .pluck to pull only the necessary 
# information from db to render datalists in view

    def new
        redirect_if_not_authorized
        @show = Show.new
        @shows = Show.all
        @genre = @show.build_genre
        @genres = Genre.all
        @composer = @show.build_composer
        @composers = Composer.all
    end

    def create 
        redirect_if_not_authorized
        @show = Show.new(shows_params)
        if @show.valid?
            @show.save
            redirect_to shows_path
        else
            @shows = Show.all
            @composers = Composer.all
            @genres = Genre.all
            render :new
        end
    end
    
    def index
        if params[:user_id]
            @shows = current_user.sorted_shows
            render 'user_shows_index'
        else
            @shows = select_shows
        end
        @genres = @shows.collect {|show| show.genre.name}.uniq
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

        def select_shows
            case params[:filter]
            when "popular"
                Show.popular
            when "from-nineteenth-century"
                Show.from_nineteenth_century
            when "from-twentieth-century"
                Show.from_twentieth_century
            when "from-twentyfirst-century"
                Show.from_twentyfirst_century
            when "all"
                Show.all
            else 
                Show.all
            end
        end
end
