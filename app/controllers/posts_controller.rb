class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.text = params[:text]

    if @post.save
      redirect_to "/posts/success"
    else
      redirect_to "/posts/fail"
    end
  end

  def delete
  end

  def edit
  end

  def show
  end

  def success
  end
end
