module ReviewsHelper

    def list_review(review)
        render partial: 'reviews/list_review', locals: {review: review}
    end

end