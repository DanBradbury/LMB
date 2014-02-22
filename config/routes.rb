Pickup::Application.routes.draw do
  root 'pages#index'
  get '/results', to: 'searches#results'
  get '/champions', to: 'searches#champions'
  get '/client_check', to: 'searches#client_check'
  get '/challenger_tt', to: 'searches#challenger_tt'
  get '/challenger_solo_sr', to: 'searches#challenger_solo_sr'
  resources :searches
  get '/lookup', to: 'pages#lookup'
  resources :reviews
end
