Rails.application.routes.draw do
  apipie
  # namespace :api do
  namespace :api, defaults: { format: :json } do 
    namespace :v1 do
      resources :follows, only: [:index, :show, :create, :update, :destroy]
      resources :messages, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
      resources :comments, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # Other application routes
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # Uncomment and modify the root path if needed
  # root "posts#index"
end
