Rails.application.routes.draw do
  
  get '/home/', to: "home#index"
  resources :products, only: [:index, :show]

  resources :authors do
    resources :books
  end

  resources :students

  resources :faculties
  
end
