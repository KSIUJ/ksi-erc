Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  post '/lock/authorize', to: 'lock#authorize'
  get '/authorize', to 'lock#legacy_authorize'

  post '/memberships/prolong', to: 'memberships#prolong'
  resources :memberships
  resources :periods
  resources :roles
  resources :members
  root 'pages#index'
end
