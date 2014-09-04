GaPlanner::Application.routes.draw do
  root to: 'welcome#index'

  get "users/new", as: 'register'
  get "sessions/new", as: 'login'
  get "admin", to: 'admins#index'
  get "sessions/destroy"
  get 'logout', to: 'sessions#destroy', as: 'logout'


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
