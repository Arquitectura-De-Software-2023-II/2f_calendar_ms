Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :crud, only: [:index, :create, :read, :update, :destroy]
      resources :pets, only: [:index, :create, :read, :update, :destroy]
      resources :events, only: [:index, :create, :read, :update, :destroy]
      resources :clients, only: [:index, :create, :read, :update, :destroy]
      resources :days, only: [:index, :create, :read, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
