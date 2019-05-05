Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :genres do
    resources :pages do
      resources :posts, only: [:show]
    end
    resources :posts do
      resources :comments
    end
  end
  # resources :posts, only: [:new, :create, :edit, :update, :destroy] do
  #   resources :comments
  # end
  #post 'posts/create'
  #post 'posts/update'
  #get 'posts/new'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/edit'
  # get 'posts/destroy'
  post 'posts/search'
  get 'posts/search'

  resources :users, only: [:new, :create,:edit, :update]
  #post 'users/create'
  #post 'users/update'
  get 'users/forgotPW'
  #get 'users/new'
  post 'users/edit'
  get 'users/before_edit'
  get 'users/my_posts'
  get 'users/my_comments'

  get 'comments/destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  
  get 'home/index'
  root 'home#index'
end
