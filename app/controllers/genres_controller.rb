$genre = Genre.all
$flag = false
class GenresController < ApplicationController
    def index
        @str = params[:str]
        if !$flag
        Genre.create(:name => "Humor")
        Genre.create(:name => "Game")
        Genre.create(:name => "News")
        Genre.create(:name => "Issue")
        Genre.create(:name => "Animal")
        $flag = true
        end
    end
end
