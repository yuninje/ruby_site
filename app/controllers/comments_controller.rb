class CommentsController < ApplicationController
    def create
        @comment = Comment.create(commenter_id: current_user.id,
            body: params[:body],
            post_id: params[:post_id])
        redirect_to :controller => "posts", :action => "show", :post_id => params[:post_id], :page => params[:page]
    end

    def destroy
        @comment = Comment.find(params[:comment_id])
        @comment.destroy

        redirect_to :controller => "posts", :action => "show", :post_id => params[:post_id], :page => params[:page]
    end
end
