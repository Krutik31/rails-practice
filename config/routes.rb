Rails.application.routes.draw do
  get '/home/', to: "home#index"
  resources :product, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
end
