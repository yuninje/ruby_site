class SessionsController < ApplicationController
    def create      # post '/login'
        user = User.find_by(user_id: params[:loginID])
        if user && user.authenticate(params[:loginPW])
            session[:user_id] = user.id
            flash[:success] = 'Successfully login'
            redirect_to genres_path
        else
            flash[:warning] = 'login failed'
            redirect_to genres_path
        end
    end

    def destroy     # get '/logout'
        session[:user_id] = nil
        flash[:success] = "Successfully logout"
        redirect_to genres_path
    end
end
