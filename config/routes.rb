Rails.application.routes.draw do
  resources :matches
  resources :tournamentteams
  resources :teamplayers
  resources :teams
  resources :tournaments
  resources :organizers
  resources :players
  resource :sessions, only: [:new,:create,:destroy]
  delete 'logout', to: 'sessions#destroy'
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
