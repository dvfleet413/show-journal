class ComposersController < ApplicationController

    def index
        @composers = Composer.all
    end

    def show
        set_composer
    end


    private
        def set_composer
            @composer = Composer.find(params[:id])
        end

end