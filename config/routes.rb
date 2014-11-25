Rails.application.routes.draw do
 
  get 'stories/:id' => 'stories#show'
  get '/' => 'stories#index'

end
