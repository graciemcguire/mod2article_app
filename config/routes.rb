Rails.application.routes.draw do
  resources :categories
  resources :users
  get '/home', to: 'users#home'
  get '/login', to: 'users#login'

  post '/login', to: 'users#authenticate'
  post '/logout', to: 'users#logout'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
