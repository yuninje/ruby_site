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
  resources :users, only: [:new, :create,:edit, :update]
  
  get 'posts/show'
  post 'posts/search'
  get 'posts/search'

  post 'users/edit'
  get 'users/before_edit'
  get 'users/my_posts'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/' => 'home#index'
  root 'home#index'
end
