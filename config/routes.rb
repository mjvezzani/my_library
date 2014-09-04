Rails.application.routes.draw do

  root to: 'sessions#new'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'pages#index', as: 'dashboard'

  resources :users
  resources :books
  resources :friends
  resources :checked_out_books, only: [:index, :create]

end
