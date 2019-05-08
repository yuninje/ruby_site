class CommentsController < ApplicationController
    def create
        @post_id = params[:post_id]
        @post = Post.find(@post_id)
        @genre = Genre.find(@post.genre_id)
        @page = params[:page]
        @comment = @post.comments.new(comment_params)
        @comment.commenter_id = current_user.id
        if @comment.save
            redirect_to  genre_post_path(@genre.name,@post_id, :page => @page)
        end
    end

    def destroy
        @post_id = params[:post_id]
        @post = Post.find(@post_id)
        @genre = Genre.find(@post.genre_id)
        @page = params[:page]
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to genre_post_path(@genre.name,@post_id, :page => @page)
    end
    private
        def comment_params
            params.require(:comment).permit(current_user.id, :body)
        end
end
