Rails.application.routes.draw do
 
  get 'stories/:id' => 'stories#show'
  get '/' => 'stories#index'
  get 'comments-for-sentence/:id' => 'stories#comments_for_sentence'

end
