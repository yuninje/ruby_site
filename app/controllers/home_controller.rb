class HomeController < ApplicationController
  def index
    post_per_page = 5

    @best_posts = Post.order(:view_count => :desc).limit(post_per_page)
    @humor_posts = Post.where(:genre => "Humor").limit(post_per_page).order(:id => :desc)    
    @game_posts = Post.where(:genre => "Game").limit(post_per_page).order(:id => :desc)  
    @news_posts = Post.where(:genre => "News").limit(post_per_page).order(:id => :desc)
    @issue_posts = Post.where(:genre => "Issue").limit(post_per_page).order(:id => :desc)
    @animal_posts = Post.where(:genre => "Animal").limit(post_per_page).order(:id => :desc)
  end
end
