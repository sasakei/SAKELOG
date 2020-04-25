Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/edit'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  root 'pages#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
   member do
     get :following, :followers
   end
  end
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
