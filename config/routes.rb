Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resource :user 
  resource :tutor 
  resource :student
  resources :appointment # or should I only put appointment resource in nested routes???
end
