Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :crud, only: [:index, :create, :show, :update, :destroy]
      resources :pets, only: [:index, :create, :show, :update, :destroy]
      resources :events, only: [:index, :create, :show, :update, :destroy]
      resources :clients, only: [:index, :create, :show, :update, :destroy]
      resources :days, only: [:index, :create, :show, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
