class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.create(commenter_id: current_user.id,
            body: params[:body],
            post_id: params[:post_id])
        redirect_to :controller => "posts", :action => "show", :id => params[:post_id]
    end
end
