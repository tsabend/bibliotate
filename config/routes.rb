Rails.application.routes.draw do

  #root "courses#index"
  root 'users#index'
  get '/auth', :to => 'users#auth'
  get '/callback', :to => 'users#callback'

  resources :users
  resources :enrollments
  resources :courses do
    resources :stories do
      resources :paragraphs do
        resources :sentences do
          resources :comments
        end
      end
    end
  end
end
