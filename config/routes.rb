Rails.application.routes.draw do

  #root "courses#index"
  root 'users#index'
  get '/auth', :to => 'users#auth'
  get '/callback', :to => 'users#callback'
  get '/type', :to => 'users#user_type'

  resources :users
  resources :enrollments
  resources :comments
  resources :courses do
    resources :stories do
    end
  end
end
