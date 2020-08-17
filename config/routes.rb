Rails.application.routes.draw do
  devise_for :users
  root "tops#index"

  resources :users ,only: [:edit, :update, :show]
  resources :answers ,only: [ :index, :new, :create, :show, :edit, :update ]
    
  resources :themes ,only: [ :index, :new, :create, :edit, :update ] do
    collection do
      get 'search'
    end
  end
end
