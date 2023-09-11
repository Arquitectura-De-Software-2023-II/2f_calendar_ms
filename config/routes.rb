Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'crud/index'
      get 'crud/create'
      get 'crud/read'
      get 'crud/update'
      get 'crud/destroy'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
