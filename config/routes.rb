Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  get '/lock/authorize', to: 'lock#legacy_authorize'
  get '/lock/last_card_id', to: 'lock#last_card_id'

  post '/memberships/prolong', to: 'memberships#prolong'
  resources :memberships
  resources :periods
  resources :roles
  resources :members
  root 'pages#index'
end
