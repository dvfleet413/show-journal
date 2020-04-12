class ShowsController < ApplicationController

# overuse of .all in #set_data_for_datalists -> use .pluck to pull only the necessary 
# information from db to render datalists in view

    def new
        redirect_if_not_authorized
        @show = Show.new
        @genre = @show.build_genre
        @composer = @show.build_composer
        set_data_for_datalists
    end

    def create 
        redirect_if_not_authorized
        @show = Show.new(shows_params)
        if @show.valid?
            @show.save
            redirect_to shows_path
        else
            set_data_for_datalists
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

    def edit
        redirect_if_not_authorized
        set_show
        set_data_for_datalists
    end

    def update
        redirect_if_not_authorized
        set_show
        if @show.update(shows_params)
            binding.pry
            redirect_to show_path(@show)
        else
            set_data_for_datalists
            render :edit
        end
    end

    def destroy
        redirect_if_not_authorized
        set_show
        if @show.viewings_count == 0 || !@show.viewings_count
            @show.destroy
            flash[:alert_warning] = "#{@show.title} successfully deleted"
            redirect_to shows_path
        else
            flash[:alert_warning] = "Shows with viewings can't be deleted this way"
            redirect_to show_path(@show)
        end
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

        def set_data_for_datalists
            @shows = Show.all
            @composers = Composer.all
            @genres = Genre.all
        end
end
