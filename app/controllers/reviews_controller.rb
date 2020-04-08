class ReviewsController < ApplicationController

    def index
        if params[:show_id]
            @show = Show.find(params[:show_id])
            @reviews = @show.reviews
        elsif params[:user_id]
            @reviews = current_user.reviews
        else
            @reviews = Review.all
        end
    end

    def show
        set_review
    end


    private
        def set_review
            @review = Review.find(params[:id])
        end

        def review_params
            params.require(:review).permit(:body, :user_id, :show_id)
        end

end