Rails.application.routes.draw do

  get '/register', to: 'users#new', as: 'login'

end
