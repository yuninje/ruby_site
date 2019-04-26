class PostsController < ApplicationController
  @@genre = ""

  def index
    @@genre = params[:genre]
    @genre = @@genre
    @page = 1
    @posts = Post.where(genre: @@genre).order(id: :desc)
  end

  
  def new
    @genre = @@genre
  end

  def create
    @post = Post.create(genre: params[:genre],
      title: params[:title],
      text: params[:text],
      author_id: current_user.id)
    redirect_to :controller => "posts", :action => "show", :id => @post.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to :controller => "posts", :action => "show", :id => @post.id
    else
      redirect_to :controller => "home", :action => "index", :str => "post update fail"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @post.view_count += 1
    @post.save
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  def fail
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :genre)
    end
end
