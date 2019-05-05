class PagesController < ApplicationController
    def show
        @genre = Genre.find(params[:genre_id])
        @genre_id = params[:genre_id]
        @page_id = params[:id]
        calculate_page
        @start_post_id = @total_post.to_i - (@page_id.to_i-1) * @post_per_page.to_i
    end

    private
        def calculate_page
            @post_per_page = 2
            @page_per_sheet = 2
        
            offset = (@page_id.to_i-1) * @post_per_page
            
            @first_page = (@page_id.to_i - 1) / @page_per_sheet * @page_per_sheet + 1
            @last_page = (@page_id.to_i - 1) / @page_per_sheet * @page_per_sheet + @page_per_sheet
            
            @total_post = Post.where(:genre_id => @genre_id).count
            
            if @total_post.to_i % @post_per_page == 0
            @total_page = @total_post.to_i / @post_per_page
            else
            @total_page = @total_post.to_i / @post_per_page + 1
            end
        
            if @total_page <= @last_page.to_i
                @last_page = @total_page
            end
        
            # offset ~ offset + post_per_page -1 가져오기
            @posts = Post.where(:genre_id => @genre_id).limit(@post_per_page).offset(offset).order(:id => :desc)
        end
end
