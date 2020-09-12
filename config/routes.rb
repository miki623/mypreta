Rails.application.routes.draw do
  root 'items#index'
  devise_for :buyers
  devise_for :sellers
  resources :items
  resources :categories, only:[:show]
end
