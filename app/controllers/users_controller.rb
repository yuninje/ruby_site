class UsersController < ApplicationController
  def login # 로그인 페이지 실행
  end

  def signIn  # 데이터베이스에 쿼리해서 비교
  end
  
  def new   # 회원가입 페이지 실행.
  end

  def create # 데이터베이스에 생성
    @user = User.new
    @user.userID = params[:userID]
    @user.userPW = params[:userPW]
    @user.userName = params[:userName]
    if @user.save
      redirect_to :controller => "users", :action => "success"
    else
      redirect_to :controller => "users", :action => "fail"
    end 

  end

  def logout
  end

  def forgotPW # 비밀번호 찾기 페이지 실행
  end

  def success
  end

  def fail
  end

  
end
