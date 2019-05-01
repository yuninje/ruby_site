Rails.application.routes.draw do
  
  post 'posts/create'
  post 'posts/update'
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'

  resources :users, only: %i[edit, update]
  post 'users/create'
  post 'users/update'
  get 'users/forgotPW'
  get 'users/new'
  post 'users/edit'
  get 'users/before_edit'
  get 'users/my_posts'
  get 'users/my_comments'

  get 'comments/destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  
  resources :comments
  
  
  root 'home#index'
end
