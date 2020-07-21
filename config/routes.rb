Rails.application.routes.draw do
  devise_for :users


  get '/dashboard_con_stimulus', to: 'dashboard#index'
  get '/dashboard_con_stimulus_reflex', to: 'dashboard#index'
  get '/dashboard_con_react_serverside_rendering', to: 'dashboard#index'
  get '/dashboard_con_react_clientside_rendering', to: 'dashboard#index'

  resources :reports, only: [:index]
  resources :candidate
  root to: "home#index"
end
