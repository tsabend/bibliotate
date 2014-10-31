Rails.application.routes.draw do
  root "courses#index"
  resources :users
  resources :enrollments
  resources :comments
  resources :courses do
    resources :stories do
    end
  end
end
