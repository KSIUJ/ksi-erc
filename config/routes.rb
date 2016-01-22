Rails.application.routes.draw do
  resources :book_leases
  delete '/book_leases/:id/return', to: 'book_leases#return', as: :return_book_lease
  resources :books
  resources :publishing_houses
  resources :authors
  get 'lock/authorize'

  get '/ksiegozbior', to: 'books#ksiegozbior', as: :ksiegozbior
  get '/members/generate_mailing', to: 'members#generate_mailing', as: :generate_mailing

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

  get '/authorize', to: 'lock#authorize', as: :authorize

  root 'pages#index'
end