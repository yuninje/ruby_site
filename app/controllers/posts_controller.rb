class PostsController < ApplicationController
  def index
    @genre = params[:genre]
    @page = params[:page]

    if @page
      calculate_page
    else
      @posts = Post.order(:view_count => :desc).limit(50)
    end

    @start_post_id = @total_post.to_i - (@page.to_i-1) * @post_per_page.to_i
  end

  def show
    @genre_id = params[:genre_id]
    @page_id = params[:page_id]
    @genre = Genre.find(@genre_id)
    @post = Post.find(params[:id])
    @post_author = User.find(@post.author_id)
    
    @comments = Comment.where(:post_id => @post.id)
    @post.view_count += 1
    @post.save

    calculate_page
    @start_post_id = @total_post.to_i - (@page_id.to_i-1) * @post_per_page.to_i
  end

  
  def new
    @genre = Genre.find(params[:genre_id])
    @post = @genre.posts.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @post = @genre.posts.new(post_params)
    @post.author_id = current_user.id

    @genre_id = params[:genre_id]
    @page_id = 1

    if @post.save
      redirect_to genre_page_post_path(@genre_id,@page_id,@post)
    end
  end

  def edit
    @genre = Genre.find(params[:genre_id])
    @post = Post.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:genre_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    @genre_id = params[:genre_id]
    @page_id = 1

    redirect_to genre_page_post_path(@genre_id,@page_id,@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    @genre_id = params[:genre_id]
    @page_id = 1
    redirect_to genre_page_path(@genre_id, @page_id)
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
      @post_per_page = 2
      @page_per_sheet = 2
  
      offset = (@page_id.to_i-1) * @post_per_page
      
      @first_page = (@page_id.to_i - 1) / @page_per_sheet * @page_per_sheet + 1
      @last_page = (@page_id.to_i - 1) / @page_per_sheet * @page_per_sheet + @page_per_sheet
      
      @total_post = Post.where(:genre_id => @genre_id).count
      
      if @total_post.to_i % @post_per_page == 0
      @total_page = @total_post.to_i / @post_per_page
      else
      @total_page = @total_post.to_i / @post_per_page + 1
      end
  
      if @total_page <= @last_page.to_i
          @last_page = @total_page
      end
  
      # offset ~ offset + post_per_page -1 가져오기
      @posts = Post.where(:genre_id => @genre_id).limit(@post_per_page).offset(offset).order(:id => :desc)
    end
end
