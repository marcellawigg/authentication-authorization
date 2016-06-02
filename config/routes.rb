Rails.application.routes.draw do
  root to: "products#index"

  resources :users, only: [:new, :create, :show]
  #
  # resources :products, only: [:index, :show]

  namespace :admin do #level of control: admins have a set piece of functionality; create methods that produce bit of functionality
    resources :categories
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
