Rails.application.routes.draw do
  get '/product/', to: "product#index"
  get '/home/', to: "home#index"
  get 'product/:id', to: "product#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
end
