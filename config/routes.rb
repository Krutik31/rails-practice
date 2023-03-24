Rails.application.routes.draw do
  get '/home/', to: 'home#index'

  resources :products, only: %i[index show]

  resources :authors do
    resources :books
  end

  resources :students

  resources :faculties

  resources :users, only: %i[index create destroy]

  resources :cars
  get '/car/search', to: 'cars#search'
  get '/download_pdf', to: 'cars#download_pdf'
end
