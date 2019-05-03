class UsersController < ApplicationController
  def new   # 회원가입 페이지 실행.
    @user = User.new
  end

  def create # 데이터베이스에 생성
    # @user = User.create(user_id: params[:user_id],
    #   password: params[:user_password],
    #   password_confirmation: params[:user_password_confirmation],
    #   name: params[:user_name])
    @user = User.create(user_params)
    redirect_to :controller => "home", :action => "index", :str => 'user create success'
  end

  def forgotPW # 비밀번호 찾기 페이지 실행
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
    @page = params[:page]

    total_count = Post.where(:author_id => current_user.id).count
    get_my_activity(total_count)
    @posts = Post.where(:author_id => current_user).limit(@post_per_page).offset(@offset).order(:created_at => :desc)

  end

  def my_comments
    @page = params[:page]

    total_count = Comment.where(:commenter_id => current_user.id).count
    get_my_activity(total_count)
    @comments = Comment.where(:commenter_id => current_user).limit(@post_per_page).offset(@offset).order(:created_at => :desc)
  end

  private
    def user_params
      params.require(:user).permit(:user_id, :password, :password_confrimation, :name, :image)
    end

    def get_my_activity(total_count)
      @post_per_page = 5
      @page_per_sheet = 5
      
  
      @offset = (@page.to_i-1) * @post_per_page
      
      @first_page = (@page.to_i - 1) / @page_per_sheet * @page_per_sheet + 1
      @last_page = (@page.to_i - 1) / @page_per_sheet * @page_per_sheet + @page_per_sheet
      
      if total_count.to_i % @post_per_page == 0
        @total_page = total_count.to_i / @post_per_page
      else
        @total_page = total_count.to_i / @post_per_page + 1
      end
  
      if @total_page <= @last_page.to_i
        @last_page = @total_page
      end
    end


  
end
