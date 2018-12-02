Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  get 'lock/authorize'

  post '/memberships/prolong', to: 'memberships#prolong'
  resources :memberships
  resources :periods
  resources :roles
  resources :members
  #resources :sessions, only: [:new, :create, :destroy]
  #get '/login', to: 'sessions#new', as: :login
  #delete '/logout', to: 'sessions#destroy', as: :logout
  #resources :users
  #get '/signup', to: 'users#new', as: :signup
  get '/authorize', to: 'lock#authorize', as: :authorize
  root 'pages#index'
end
