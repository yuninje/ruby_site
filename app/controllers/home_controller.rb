class HomeController < ApplicationController
  def index
    @str = params[:str]
  end
end
