Pseudotwitter::Application.routes.draw do
  devise_for :users

  resources :tweets
  resources :users, only: :show

  root :to => "tweets#index"
end
