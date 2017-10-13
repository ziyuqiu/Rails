Rails.application.routes.draw do
  root 'home#index'

  get 'sessions/new'
  get  '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :courses do
    post :enroll
  end
  resources :subjects
  resources :instructors
  resources :registrations
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
