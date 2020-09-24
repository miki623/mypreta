Rails.application.routes.draw do
  root 'items#index'
  devise_for :buyers, controllers: {
    registrations: 'buyers/registrations'
  }
  devise_for :sellers, controllers: {
    registrations: 'sellers/registrations'
  }
  resources :items do
    member do
      get 'confirmation'
    end
    resources :deals, only:[:show] do
      resources :comments, only:[:create]
    end
    resources :transactions, only:[:index, :create]
  end
  resources :categories, only:[:show]

  devise_scope :seller do
    get 'sellers/:id', to: 'sellers#show', as: 'seller'
    get '/sellers/:id/history', to: 'sellers#history', as: 'history_seller'
    post 'sellers/guest_sign_in', to: 'sellers/sessions#new_guest'
  end

  devise_scope :buyer do
    get 'buyers/:id', to: 'buyers#show', as: 'buyer'
    post 'buyers/guest_sign_in', to: 'buyers/sessions#new_guest'
  end
  
end
