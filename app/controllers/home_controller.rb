class HomeController < ApplicationController
  def index
  end

  def humor
    
  end

  def game
    @posts = Post.all
  end

  def news
  end

  def issue
  end

  def animal
  end

  def genre
    @posts = Post.all
  end

end
