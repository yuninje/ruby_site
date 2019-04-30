class PostsController < ApplicationController
  @@genre = ""
  

  def index
    @post_per_page = 5
    @page_per_sheet = 5
    
    @@genre = params[:genre]
    @genre = @@genre
    @page = params[:page]
    offset = (@page.to_i-1) * @post_per_page
    
    @first_page = (@page.to_i-1)/@page_per_sheet*@page_per_sheet+1
    @last_page = (@page.to_i-1)/@page_per_sheet*@page_per_sheet+@page_per_sheet
    total_post = Post.where(:genre => @@genre).count
    
    if total_post.to_i % @post_per_page == 0
      @total_page = total_post.to_i/@post_per_page
    else
      @total_page = total_post.to_i/@post_per_page+1
    end

    if @total_page <= @last_page.to_i
      @last_page = @total_page
    end

    @posts = Post.where(:genre => @@genre).limit(@post_per_page).offset(offset).order(:id => :desc)
  end

  
  def new
    @genre = @@genre
    @post = Post.new
  end

  def create
    @post = Post.new(
      :genre => params[:genre],
      :title => params[:title],
      :text => params[:text]
    )
    @post.author_id = current_user.id

    if @post.save
      redirect_to :controller => "posts", :action => "show", :post_id => @post.id, :page => 1
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @page = params[:page]
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update(
      :title => params[:title],
      :text => params[:text],
      :genre => params[:genre])
      redirect_to :controller => "posts", :action => "show", :post_id => @post.id, :page => params[:page]
    else
      redirect_to :controller => "home", :action => "index", :str => "post update fail"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    redirect_to :controller => "posts", :action => "index", :page => params[:page], :genre => params[:genre]
  end

  def show
    @post = Post.find(params[:post_id])
    @post_author = User.find(@post.author_id)
    @page = params[:page]
    @comments = Comment.where(:post_id => @post.id)
    @post.view_count += 1
    @post.save
  end

  private
    def post_params
      params.require(:post).permit(:genre, :text, :title)
    end
end
