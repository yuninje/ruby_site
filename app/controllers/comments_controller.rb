class CommentsController < ApplicationController
    def create
        @genre = Genre.find_by(:name => params[:genre_name])
        @genre_id = @genre.id
        @post_id = params[:post_id]
        @post = Post.find(@post_id)
        @comment = @post.comments.new(comment_params)
        @comment.commenter_id = current_user.id
        if @comment.save
            redirect_to  genre_page_post_path(@genre_id,1,@post_id)
        end
    end

    def destroy
        @genre = Genre.find_by(:name => params[:genre_name])
        @genre_id = @genre.id
        @post_id = params[:post_id]


        @post = Post.find(@post_id)
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to genre_page_post_path(@genre_id,1,@post_id)
    end
    private
        def comment_params
            params.require(:comment).permit(current_user.id, :body)
        end
end
