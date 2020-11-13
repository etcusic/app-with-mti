Rails.application.routes.draw do
  
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_with_omniauth'
  
  get '/tutors/highly_rated' => 'tutors#highly_rated'

  # get '/appointments/soonest_available' => 'appointments#soonest_available - if tutors can set up availability

  resources :users, only: [:new, :create, :show, :edit, :destroy] do
    resources :appointments
  end 

  resources :students, only: [:index, :edit, :update]
  resources :tutors, only: [:index, :edit, :update]

  get '/nacho_stuff' => 'errors#nacho_stuff'

end
