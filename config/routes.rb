Rails.application.routes.draw do
  
  post 'posts/create'
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'

  post 'users/create'
  get 'users/forgotPW'

  get 'comments/destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  
  resources :comments
  resources :users
  
  root 'home#index'
end
