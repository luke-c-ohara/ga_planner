GaPlanner::Application.routes.draw do
  root to: 'welcome#index'

  resources :users
  resources :courses
  resources :classrooms

end
