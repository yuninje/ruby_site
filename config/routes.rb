Rails.application.routes.draw do
  
  post 'posts/new'
  post 'posts/create'
  get 'posts/delete'
  get 'posts/edit'
  get 'posts/show'
  get 'posts/success'
  get 'posts/fail'

  
  get 'users/login'
  get 'users/signUp'
  get 'users/logout'
  get 'users/signIn'
  get 'users/forgotPW'
  get 'users/new'
  
  get 'home/index'
  get 'home/humor'
  get 'home/game'
  get 'home/news'
  get 'home/issue'
  get 'home/animal'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
