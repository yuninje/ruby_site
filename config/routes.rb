Rails.application.routes.draw do
  
  post 'posts/create'

  post 'users/create'
  get 'users/forgotPW'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts
  resources :comments
  resources :users
  
  root 'home#index'
end
