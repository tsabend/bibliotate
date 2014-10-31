Rails.application.routes.draw do
  root "stories#index"
  resources :users
  resources :enrollments
  resources :courses do
    resources :stories do
      resources :sentences do
        resources :comments
      end
    end
  end
end
