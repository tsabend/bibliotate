Rails.application.routes.draw do
 
  get 'stories/:id' => 'stories#show'
  get '/' => 'stories#index'
  get 'comments-for-sentence/:id' => 'stories#comments_for_sentence'
  get 'users-for-comments/:id' => 'stories#users_for_comments'
end
