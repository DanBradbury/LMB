Pickup::Application.routes.draw do
  root 'pages#index'
  get '/results', to: 'searches#results'
  resources :searches
  get '/lookup', to: 'pages#lookup'
end
