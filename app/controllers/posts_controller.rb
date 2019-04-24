class PostsController < ApplicationController
  def index
    @genre = params[:genre]
    @page = 1
    @posts = Post.all
  end
  
  def new
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.text = params[:text]

    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to "/posts/fail"
    end
  end

  def delete
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    @post.view_count += 1
    @post.save
  end

  def success
  end
end
