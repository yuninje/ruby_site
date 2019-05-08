Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/my-post'=>'posts#show'
  post 'posts/search'
  get 'posts/search'
  
  post 'users/edit'
  get 'users/before_edit'
  get '/my-posts' => 'users#my_posts'


  resources :users, only: [:new, :create,:edit, :update]
  
  resources :genres, param: :name, :path => '' do 
    resources :posts, :path => '' do
      resources :comments
    end
  end
  root 'genres#index'
end
