Rails.application.routes.draw do
  devise_for :users


  get '/dashboard_con_stimulus', to: 'dashboard#index'
  get '/dashboard_con_react', to: 'dashboard#index'

  resources :reports, only: [:index]
  resources :candidate
  root to: "home#index"
end
