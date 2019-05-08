$genre = Genre.all
$flag = false
class GenresController < ApplicationController
    def index
        @str = params[:str]
        @page = 1
        if !$flag
            Genre.delete_all
            Genre.create(:name => "humor")
            Genre.create(:name => "game")
            Genre.create(:name => "news")
            Genre.create(:name => "issue")
            Genre.create(:name => "animal")
            $flag = true
        end
    end

    def show
        @genre = Genre.find_by(:name => params[:genre_name])
        @genre_id = @genre.id
        @page = params[:page]
        calculate_page
        @start_post_id = @total_post.to_i - (@page.to_i-1) * $post_per_page.to_i
    end

    private
        def calculate_page
            offset = (@page.to_i-1) * $post_per_page
            
            @first_page = (@page.to_i - 1) / $page_per_sheet * $page_per_sheet + 1
            @last_page = (@page.to_i - 1) / $page_per_sheet * $page_per_sheet + $page_per_sheet
            
            @total_post = Post.where(:genre_id => @genre_id).count
            
            if @total_post.to_i % $post_per_page == 0
            @total_page = @total_post.to_i / $post_per_page
            else
            @total_page = @total_post.to_i / $post_per_page + 1
            end
        
            if @total_page <= @last_page.to_i
                @last_page = @total_page
            end
        
            # offset ~ offset + post_per_page -1 가져오기
            @posts = Post.where(:genre_id => @genre_id).limit($post_per_page).offset(offset).order(:id => :desc)
        end
end
