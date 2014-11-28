Rails.application.routes.draw do
 
  get 'stories/:id' => 'stories#show'
  get '/' => 'stories#index'
  get 'comments-for-sentence/:id' => 'stories#comments_for_sentence'
  get 'new-comments-for-story/:id' => 'stories#new_comments_for_story'
  get 'most-commented-sentences-for-story/:id' => 'stories#new_comments_for_story'
  post 'comments-for-sentence/:id' => 'stories#create_comment_for_sentence'
end
