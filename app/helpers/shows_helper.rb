module ShowsHelper

    def composer_name(show)
        show.composer.name
    end

    def genre_name(show)
        show.genre.name
    end

end