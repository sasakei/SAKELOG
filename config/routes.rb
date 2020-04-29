Rails.application.routes.draw do
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'password_resets/new'
  # get 'password_resets/edit'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  root 'pages#index'
  get '/about',     to: 'pages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
   member do
     get :following, :followers
   end
  end

  resources :microposts, shallow: true do
    resource :bookmarks, only: %i[create destroy]
    get :bookmarks, on: :collection
  end

  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]

end
