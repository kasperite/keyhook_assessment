Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    get "/" => "listings#index"
    resources :listings, only: %i[show index] do
      resources :schedules, only: %i[new create]
      resources :availabilities, only: %i[index]
      resources :bookings, only: %i[show]
      member do
        get "/calendar" => "listings#calendar"
      end
    end
  end

  resources :listings, only: :show do
    resource :bookings, only: %i[new create]
  end

  resource :session
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
