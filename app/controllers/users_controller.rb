class UsersController < ApplicationController
  def new   # 회원가입 페이지 실행.
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to :controller => "home", :action => "index", :str => 'user create success'
  end

  def edit
    @pw = params[:password]
    if current_user.authenticate(params[:password])
      @str = "success"
      @user = User.find(current_user.id)
    else
    redirect_to :controller => "users", :action => "before_edit", :str => "retry please"
    end
  end

  def before_edit
    @str = params[:str]
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to :controller => "home", :action => "index", :str => "user update success"
    else
      redirect_to :controller => "home", :action => "index", :str => "user update fail"
    end
  end

  def my_posts
    @page_id = params[:page]

    get_my_posts
    @start_post_id = @total_post_count.to_i - (@page_id.to_i-1) * $post_per_page.to_i
  end

  private
    def user_params
      params.require(:user).permit(:user_id, :password, :password_confrimation, :name, :image)
    end

    def get_my_posts
  
      @offset = (@page_id.to_i-1) * $post_per_page
      
      @first_page = (@page_id.to_i - 1) / $page_per_sheet * $page_per_sheet + 1
      @last_page = (@page_id.to_i - 1) / $page_per_sheet * $page_per_sheet + $page_per_sheet
      
      total_posts = Post.where(:author_id => current_user.id)
      @total_post_count = total_posts.count

      if @total_post_count.to_i % $post_per_page == 0
        @total_page = @total_post_count.to_i / $post_per_page
      else
        @total_page = @total_post_count.to_i / $post_per_page + 1
      end
  
      if @total_page <= @last_page.to_i
        @last_page = @total_page
      end

      @posts = total_posts.limit($post_per_page).offset(@offset).order(:created_at => :desc)
    end
end
