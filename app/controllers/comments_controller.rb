class CommentsController < ApplicationController
    def create
        @comment = Comment.create(commenter_id: current_user.id,
            body: params[:body],
            post_id: params[:post_id])
        redirect_to :controller => "posts", :action => "show", :post_id => params[:post_id], :page => params[:page]
    end

    def destroy
        if params[:deleted_post_id]
            @comments = Comment.where(:post_id => params[:deleted_post_id])
            @comments.each do |comment|
                comment.destroy
            end
            redirect_to :controller => "posts", :action => "index", :genre => params[:genre], :page => params[:page]
        else
            @comment = Comment.find(params[:comment_id])
            @comment.destroy
            redirect_to :controller => "posts", :action => "show", :post_id => params[:post_id], :page => params[:page]
        end
    end
end
