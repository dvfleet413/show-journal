class ViewingsController < ApplicationController

    def new  
        redirect_if_not_authorized
        set_show
        @viewing = Viewing.new
        @review = @viewing.build_review
    end

    def create
        redirect_if_not_authorized
        @viewing = Viewing.create!(viewings_params)
        redirect_to user_path(current_user)
    end

    def edit 
        redirect_if_not_authorized
        set_show
        set_viewing
    end

    def update 
        redirect_if_not_authorized
        set_viewing
        if @viewing.update(viewings_params)
            redirect_to user_shows_path(current_user)
        else
            set_show
            render :edit
        end
    end

    def destroy
        redirect_if_not_authorized
        set_viewing
        if current_user == @viewing.user
            @viewing.destroy
        else 
            flash[:alert_warning] = "You can only delete your own journal entries"
        end
        redirect_to user_shows_path(current_user)
    end


    private
        def set_show
            @show = Show.find(params[:show_id])
        end

        def set_viewing
            @viewing = Viewing.find(params[:id])
        end

        def viewings_params
            params.require(:viewing).permit(:date, :location, :show_id, :user_id, 
                                            review_attributes: [:body, :rating])
        end

end