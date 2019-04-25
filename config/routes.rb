Rails.application.routes.draw do
  
  post 'posts/create'
  get 'posts/fail'

  post 'users/create'
  get 'users/success'
  get 'users/fail'
  get 'users/login'
  get 'users/logout'
  get 'users/signIn'
  get 'users/forgotPW'

  resources :posts do
    resources :comments
  end
  resources :users
  root 'home#index'
end
