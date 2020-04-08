class ViewingsController < ApplicationController

    def new  
        @show = Show.find(params[:show_id])
        @viewing = Viewing.new
        @review = @viewing.build_review
    end

    def create
        @viewing = Viewing.create!(viewings_params)
        redirect_to user_path(current_user)
    end


    private
        def viewings_params
            params.require(:viewing).permit(:date, :location, :show_id, :user_id, 
                                            review_attributes: [:body, :rating])
        end

end