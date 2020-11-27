Rails.application.routes.draw do
  
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_with_omniauth'

  get '/tutors/highly_rated' => 'tutors#highly_rated'

  resources :appointments, only: [:new, :create]

  resources :students do
    resources :appointments, only: [:index, :show, :edit, :update, :destroy]
  end 

  resources :tutors do
    resources :appointments, only: [:index, :show, :edit, :update, :destroy]
  end 
 
  # get '/appointments/soonest_available' => 'appointments#soonest_available - if tutors can set up availability

  get '/nacho_stuff' => 'errors#nacho_stuff'

end
