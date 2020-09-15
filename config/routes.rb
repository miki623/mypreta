Rails.application.routes.draw do
  root 'items#index'
  devise_for :buyers
  devise_for :sellers
  resources :items do
    member do
      get 'confirmation'
    end
    resources :transactions, only:[:index, :create]
  end
  resources :categories, only:[:show]
  resources :sellers, only:[:show]
  
end
