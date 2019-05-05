class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authenticate_user!
        redirect_to :controller => 'home', :action => 'index', :str => 'unless current_user 같음;'
    end
end