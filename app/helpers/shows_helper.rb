module ShowsHelper

    def composer_name(show)
        show.composer.name
    end

    def genre_name(show)
        show.genre.name
    end

    def current_user_viewings(show)
        show.viewings.select{|viewing| viewing.user == current_user}
    end
end