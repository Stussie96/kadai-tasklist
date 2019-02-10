Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

    root to: "tasks#index"
    get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
