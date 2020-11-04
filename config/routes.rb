Rails.application.routes.draw do
  # root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_with_omniauth'

  resources :users
  resources :tutors
  resources :students
  resources :appointments # or should I only put appointment resource in nested routes???

  root 'application#home'
end
