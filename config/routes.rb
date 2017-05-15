Rails.application.routes.draw do
  resources :events
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :matches
  resources :tournamentteams
  resources :teamplayers
  resources :teams
  resources :tournaments
  resources :organizers
  resources :players
  resource :sessions, only: [:new,:create]
  delete 'logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
