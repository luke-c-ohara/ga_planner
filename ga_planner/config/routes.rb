GaPlanner::Application.routes.draw do

  resources :users
  resources :courses
  resources :classrooms

  root to: 'welcome#index'

end
