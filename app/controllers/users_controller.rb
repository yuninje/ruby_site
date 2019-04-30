class UsersController < ApplicationController
  def new   # 회원가입 페이지 실행.
  end

  def create # 데이터베이스에 생성
    @user = User.create(user_id: params[:user_id],
      password: params[:user_password],
      password_confirmation: params[:user_password_confirmation],
      name: params[:user_name])
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

  private
    def user_params
      params.require(:user).permit(:name, :image)
    end
  
end
