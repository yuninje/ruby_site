Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create,:edit, :update]
  
  resources :genres, param: :name, :path => '' do 
    resources :pages, :path => '' do
      resources :posts, only: [:show], :path => ''
    end
    resources :posts, :path => '' do
      resources :comments
    end
  end

  get 'posts/show'
  post 'posts/search'
  get 'posts/search'

  post 'users/edit'
  get 'users/before_edit'
  get 'users/my_posts'

  root 'genres#index'
end
