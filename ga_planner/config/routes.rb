GaPlanner::Application.routes.draw do
  root to: 'welcome#index'

  get "users/new", as: 'register'
  get "sessions/new", as: 'login'
  get "sessions/destroy"
  get 'logout', to: 'sessions#destroy', as: 'logout'

# get '/enrollments/new/:cohort_id', to: 'enrollments#new', as: 'enroll'
# get '/contracts/new/:cohort_id', to: 'contracts#new', as: 'instruct'

  resources :users
  resources :courses

  resources :classrooms do
    resources :bookings 
  end
  
  resources :cohorts do 
    resources :enrollments
    resources :contracts 
  end
  
  resources :sessions

end
