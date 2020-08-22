Rails.application.routes.draw do
  devise_for :users
  root "tops#index"

  resources :users ,only: [:edit, :update, :show] do
    resources :friend_requests ,only: [:new, :create, :destroy ] 
  end

  resources :user_friends ,only: [:new, :create, :index ,:destroy]
  
  resources :answers ,only: [ :index, :new, :create, :show, :edit, :update ] do
    resources :comments ,only:[ :create, :edit, :update, :destroy] 
  end

  resources :themes ,only: [ :index, :new, :create, :edit, :update ] do
    collection do
      get 'search'
    end
  end

  post '/answers/:answers_id/:comment_id/likes' => "likes#create"
  delete '/answers/:answers_id/:comment_id/likes' => "likes#destroy"

end
