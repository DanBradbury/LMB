Pickup::Application.routes.draw do
  root 'pages#index'
  get '/lookup', to: 'pages#lookup'
end
