Rails.application.routes.draw do
  
  resources :posts do
    resources :comments
  end
  resources :users
  resources :home
  
  post 'posts/update'
  post 'posts/new'
  post 'posts/create'
  
  get 'users/login'
  get 'users/signUp'
  get 'users/logout'
  get 'users/signIn'
  get 'users/forgotPW'
  get 'users/new'
  
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
