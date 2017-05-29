Rails.application.routes.draw do
  resources :nominates
  resources :results
  resources :events, only:[:new,:create]
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  resource :nominate , only: [:new,:create,:show]
  resources :matches
  resources :tournamentteams
  resources :teamplayers
  resources :teams
  resources :tournaments
  resources :players
  resource :sessions, only: [:new, :create, :destroy]
  get 'stadistic', to: 'tournaments#stadistic'
  #get '*foo' => 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
