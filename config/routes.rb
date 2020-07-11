Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index]
  resources :reports, only: [:index]
  root to: "home#index"
end
