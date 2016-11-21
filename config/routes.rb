Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'restaurants#index'

  resources :restaurants do
    resources :reviews
  end
end
