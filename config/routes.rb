Pseudotwitter::Application.routes.draw do
  devise_for :users

  resources :tweets
  resources :users, only: :show
  resources :follows, only: [ :create, :destroy ]

  root :to => "tweets#index"
end
