Rails.application.routes.draw do
  resources :users
  get 'users/new'

  resources :courses
  resources :subjects
  resources :instructors
  resources :registrations
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
