Rails.application.routes.draw do

  root 'pages#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/guest_sign_in', to: 'sessions#new_guest'
  get '/about',     to: 'pages#about'



  resources :users do
   member do
     get :following, :followers
   end
  end

  resources :microposts, shallow: true do
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
    resources :comments, only: [:create, :destroy]
  end

  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]

end
