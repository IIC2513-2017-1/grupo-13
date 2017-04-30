Rails.application.routes.draw do
  resources :teamplayers
  resources :teams
  resources :tournaments
  resources :organizers
  resources :players
  resources :matches
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
