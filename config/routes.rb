Rails.application.routes.draw do
  
  #get 'relationships/create'
  #get 'relationships/destory'
  #get 'book_comments/create'
  #get 'book_comments/destroy'
  #get 'favorites/create'
  #get 'favorites/destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  
  get "home/about"=>"homes#about"
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources:book_comments, only:[:create,:destroy]
  end    
  
  resources :users, only: [:index,:show,:edit,:update] do
    get :following
    get :followed
  end  
  
  get 'relationships/create'
  get 'relationships/destroy'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get '/search' => 'search#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end  