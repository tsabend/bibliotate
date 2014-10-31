Rails.application.routes.draw do
  root "stories#index"
  resources :users
  resources :enrollments
  resources :classes do
    resources :stories do
      resources :sentences do
        resources :comments
      end
    end
  end
end
