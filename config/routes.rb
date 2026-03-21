Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    get "/" => "dashboard#index", as: :dashboard
    resources :users do
      resources :availabilities, only: %i[index]
      resources :schedules, only: %i[new create]
    end
  end
  
  resource :session
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
