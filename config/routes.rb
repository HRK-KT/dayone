Rails.application.routes.draw do
  devise_for :users
  root "tops#index"

  resources :answers ,only: [ :index, :new, :create, :show ]
  resources :themes ,only: [ :index, :new, :create ]
end
