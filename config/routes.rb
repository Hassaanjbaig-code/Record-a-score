Rails.application.routes.draw do
  root 'players#index'
  
  resources :players, only: [:index, :new, :create] do
    resources :games, only: [:index, :new, :create, :destroy] do
      resources :cashes, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
