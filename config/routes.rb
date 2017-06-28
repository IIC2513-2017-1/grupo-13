Rails.application.routes.draw do
  resources :nominates
  resources :results
  resources :events, only:[:new,:create]
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  resource :nominate , only: [:new,:create,:show]
  resources :matches
  resources :tournamentteams, only:[:new,:create,:destroy]
  resources :teamplayers, only:[:new,:create,:destroy]
  resources :teams
  resources :tournaments
  resources :players do
    member do
      get :confirm,:email
    end
  end
  resource :sessions, only: [:new, :create, :destroy]
  get '/leagues_news', to: 'tournaments#leagues_news'
  get 'stadistic', to: 'tournaments#stadistic'
  # get '*foo' => 'static_pages#home'

  namespace :api do
    namespace :v1 do
      resources :teams, only: [:index, :create, :show]
      resources :players, only: [:show]
    end
  end
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
