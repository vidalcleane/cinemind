Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users

  # Root path
  root 'movies#index'

  # Movies resources with nested comments
  resources :movies do
    resources :comments, only: [:create, :destroy]
  end

  # Movie imports (CSV upload)
  resources :movie_imports, only: [:new, :create, :show] do
    member do
      get :status
    end
  end

  # AI Search endpoint
  post 'ai_search', to: 'ai_searches#search'

  # Categories
  resources :categories, only: [:index]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
