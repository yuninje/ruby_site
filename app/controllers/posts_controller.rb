class PostsController < ApplicationController
  def index
    @genre = Genre.find_by(:name => params[:genre_name])
    @page = params[:page]

    calculate_page
  end

  def show
    if @genre = Genre.find_by(:name => params[:genre_name])
      @page = params[:page]
      @post = Post.find(params[:id])
      @post_id = @post.id
      @post_author = User.find(@post.author_id)
      @comments = @post.comments
      
      @post.view_count += 1
      @post.save

      calculate_page
    else
      @search = params[:search]
      @page = params[:page]
      @post_id = params[:post_id]
      @post = Post.find(@post_id)
      @genre = Genre.find(@post.genre_id)
      @post_author = User.find(@post.author_id)

      @post.view_count += 1
      @post.save
      @my_activity = true
      calculate_page
    end
  end

  
  def new
    @genre = Genre.find_by(:name => params[:genre_name])
    @post = @genre.posts.new
  end

  def create
    @genre = Genre.find(params[:genre_name])
    @post = @genre.posts.new(post_params)
    @post.author_id = current_user.id
    @page = 1

    if @post.save
      redirect_to genre_post_path(@genre.name,@post, :page => 1)
    end
  end

  def edit
    @genre = Genre.find_by(:name => params[:genre_name])
    @post = Post.find(params[:id])
    @page = params[:page]
  end

  def update
    @genre = Genre.find(params[:genre_name])
    @post = Post.find(params[:id])
    @post.update(post_params)
    @page = params[:page]

    redirect_to genre_post_path(@genre.name,@post, :page => @page)
  end

  def destroy
    @genre = Genre.find_by(:name => params[:genre_name])
    @post = Post.find(params[:id])
    @post.destroy
    @page = 1

    redirect_to genre_path(@genre.name, :page => @page)
  end

  def search
    @search = params[:search]
    @page = params[:page]
    calculate_page
  end

  private
    def post_params
      params.require(:post).permit(:genre, :title, :text)
    end

    def calculate_page  
      offset = (@page.to_i-1) * $post_per_page
      
      @first_page = (@page.to_i - 1) / $page_per_sheet * $page_per_sheet + 1
      @last_page = (@page.to_i - 1) / $page_per_sheet * $page_per_sheet + $page_per_sheet
      
      if @search
        @total_post = Post.where('title Like ?', "%#{@search}%")
      elsif @my_activity
        @total_post = Post.where(:author_id => current_user.id)
      else
        @total_post = Post.where(:genre_id => @genre.id)
      end

      @total_post_count = @total_post.count

      if @total_post_count.to_i % $post_per_page == 0
        @total_page = @total_post_count.to_i / $post_per_page
      else
        @total_page = @total_post_count.to_i / $post_per_page + 1
      end
  
      if @total_page <= @last_page.to_i
          @last_page = @total_page
      end
  
      # offset ~ offset + post_per_page -1 가져오기
      @posts = @total_post.limit($post_per_page).offset(offset).order(:id => :desc)
      @start_post_id = @total_post_count.to_i - (@page.to_i-1) * $post_per_page.to_i
    end
end
