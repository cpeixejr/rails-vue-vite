Rails.application.routes.draw do
  defaults export: true do
    devise_for :users, skip: [:sessions, :passwords, :registrations]

    as :user do
      get "login", to: "users/sessions#new", as: :new_user_session
      post "login", to: "users/sessions#create", as: :user_session
      match "logout", to: "users/sessions#destroy", as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    end

    resources :expenses
    resources :categories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "expenses#index"
end
