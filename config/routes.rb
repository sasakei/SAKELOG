Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  root 'pages#index'
end
