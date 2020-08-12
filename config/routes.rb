Rails.application.routes.draw do
  devise_for :users
  root "tops#index"

  resources :users ,only: [:edit, :update]
  resources :answers ,only: [ :index, :new, :create, :show ]
    
  resources :themes ,only: [ :index, :new, :create ] do
    collection do
      get 'search'
    end
  end
end
