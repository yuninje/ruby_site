class PostsController < ApplicationController
  @@genre = ""
  

  def index
    @post_per_page = 2
    @page_per_sheet = 3
    
    @@genre = params[:genre]
    @genre = @@genre
    @page = params[:page]
    offset = (@page.to_i-1) * @post_per_page
    
    @first_page = (@page.to_i-1)/@page_per_sheet*@page_per_sheet+1
    @last_page =   (@page.to_i-1)/@page_per_sheet*@page_per_sheet+@page_per_sheet
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
  end

  def create
    @post = Post.create(genre: params[:genre],
      title: params[:title],
      text: params[:text],
      author_id: current_user.id)
    redirect_to :controller => "posts", :action => "show", :post_id => @post.id
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])

    if @post.update(post_params)
      redirect_to :controller => "posts", :action => "show", :post_id => @post.id
    else
      redirect_to :controller => "home", :action => "index", :str => "post update fail"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    redirect_to :controller => "home", :action => "index", :str => "destroy 성공"
  end

  def show
    @post = Post.find(params[:post_id])
    @before_page = params[:before_page]
    @comments = Comment.where(post_id: params[:post_id])
    @post.view_count += 1
    @post.save
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :genre)
    end
end
