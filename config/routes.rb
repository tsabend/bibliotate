Rails.application.routes.draw do
  root "courses#index"
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
