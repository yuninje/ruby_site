$genre = Genre.all
class GenresController < ApplicationController
    @@a = 0
    def index
        @str = params[:str]
        $genre = Genre.all
        if @@a == 0
        Genre.create(:name => "Humor")
        Genre.create(:name => "Game")
        Genre.create(:name => "News")
        Genre.create(:name => "Issue")
        Genre.create(:name => "Animal")
        @@a = 1
        end
    end
end
