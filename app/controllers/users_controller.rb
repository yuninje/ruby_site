class UsersController < ApplicationController
  def login # 로그인 페이지 실행
  end

  def signIn  # 데이터베이스에 쿼리해서 비교
  end
  
  def new   # 회원가입 페이지 실행.
  end

  def create # 데이터베이스에 생성
    User.create(name: params[:user_name],
      user_id: params[:user_id],
      password: params[:user_password],
      password_confirmation: params[:user_password_confirmation])
    redirect_to :controller => "home", :action => "index"
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
