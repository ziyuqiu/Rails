Rails.application.routes.draw do
  resources :users
  resources :courses do
    post :enroll
  end
  resources :subjects
  resources :instructors
  resources :registrations

  root 'home#index'
  get '/search', to:'search#index'
  get '/course/search', to:'search#index'

  get 'sessions/new'
  get  '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
