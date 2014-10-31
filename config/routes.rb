Rails.application.routes.draw do

  #root "courses#index"
  root 'users#index'
  get '/auth', :to => 'users#auth'
  get '/callback', :to => 'users#callback'

  resources :users
  resources :enrollments
  resources :comments
  resources :courses do
    resources :stories do
    end
  end
end
