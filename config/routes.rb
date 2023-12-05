Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :memories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :memories, only: [:new, :create] do
    resources :key_memories
  end
  get "timeline", to: "pages#timeline"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
end
