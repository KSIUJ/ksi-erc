Rails.application.routes.draw do
  get 'lock/authorize'

  get '/members/generate_mailing', to: 'members#generate_mailing', as: :generate_mailing
  get '/memberships/filter/:id(/:exportable)', to: 'memberships#show_filtered', as: :memberships_show_filtered
  get '/memberships-stats', to: 'memberships#stats', as: :memberships_stats

  post '/memberships/prolong', to: 'memberships#prolong'
  resources :memberships
  resources :comments
  resources :periods
  resources :roles
  resources :members
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :members
  resources :roles
  resources :periods
  resources :memberships
  resources :users
  get '/signup', to: 'users#new', as: :signup

  get '/authorize', to: 'lock#authorize', as: :authorize

  root 'pages#index'
end
