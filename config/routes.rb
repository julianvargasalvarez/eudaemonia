Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index]
  resources :reports, only: [:index]
  resources :candidate
  root to: "home#index"
end
