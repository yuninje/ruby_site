class PostsController < ApplicationController
  def index
    @genre = params[:genre]
    @page = params[:page]

    if @page
      calculate_page
    else
      @posts = Post.order(:view_count => :desc).limit(50)
    end
  end

  
  def new
    @post = Post.new
    @post.genre = params[:genre]
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to :controller => "posts", :action => "show", :post_id => @post.id, :page => 1
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :controller => "posts", :action => "show", :post_id => @post.id, :page => 1
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    genre = params[:genre]
    page = params[:page]
    @post.destroy

    redirect_to :controller => "posts", :action => "index", :genre => genre, :page => page
  end

  def show
    @post = Post.find(params[:post_id])
    @post_author = User.find(@post.author_id)
    @comments = Comment.where(:post_id => @post.id)
    @post.view_count += 1
    @post.save

    unless @page = params[:page]
      @page = 1
    end

    unless @search = params[:search]
      @genre = @post.genre
    end

    calculate_page
  end

  def search
    @search = params[:search]
    @page = params[:page]
    calculate_page
  end

  private
    def post_params
      params.require(:post).permit(:genre, :text, :title)
    end

    def calculate_page
      post_per_page = 5
      @page_per_sheet = 5
  
      offset = (@page.to_i-1) * post_per_page
      
      @first_page = (@page.to_i - 1) / @page_per_sheet * @page_per_sheet + 1
      @last_page = (@page.to_i - 1) / @page_per_sheet * @page_per_sheet + @page_per_sheet
      
      if @genre
        total_post = Post.where(:genre => @genre).count
      elsif @search
        total_post = Post.where('title Like ?', "%#{@search}%").count
      end
      
      if total_post.to_i % post_per_page == 0
        @total_page = total_post.to_i / post_per_page
      else
        @total_page = total_post.to_i / post_per_page + 1
      end
  
      if @total_page <= @last_page.to_i
        @last_page = @total_page
      end
  
      # offset ~ offset + post_per_page -1 가져오기
      if @genre
        @posts = Post.where(:genre => @genre).limit(post_per_page).offset(offset).order(:id => :desc)
      elsif @search
        @posts = Post.where('title Like ?', "%#{@search}%").limit(post_per_page).offset(offset).order(:id => :desc)
      end
    end
end
