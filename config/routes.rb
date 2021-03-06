Rails.application.routes.draw do
  
  get 'toppages/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: "tasks#index"
  get 'signup', to: 'users#new'
  get 'login',  to: "sessions#new"
  post 'login', to:  "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :users, only: [:index, :show, :new, :create]
  resources :tasks
end
