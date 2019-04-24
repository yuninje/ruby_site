Rails.application.routes.draw do
  
  resources :posts
  resources :users
  resources :home
  post 'posts/new'
  post 'posts/create'
  get 'posts/delete'
  get 'posts/edit'
  get 'posts/show'
  get 'posts/success'
  get 'posts/fail'
  get 'posts/index'

  
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
