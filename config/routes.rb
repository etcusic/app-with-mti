Rails.application.routes.draw do
  
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_with_omniauth'
  
  get '/tutors/highest_rated' => 'tutors#highest_rated'

  # get '/appointments/soonest_available' => 'appointments#soonest_available - if tutors can set up availability

  resources :users do
    # only: [:new, :create, :show, :destroy] ???
    resources :appointments
  end 

  resources :students, only: [:index, :edit, :update]
  resources :tutors, only: [:index, :edit, :update]

end
