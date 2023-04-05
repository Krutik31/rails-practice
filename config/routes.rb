Rails.application.routes.draw do
  get '/home/', to: 'home#index'

  resources :products, only: %i[index show]

  resources :authors do
    resources :books
  end

  resources :students

  resources :faculties

  resources :users, only: %i[index create destroy]
  get '/user/logout', to: 'users#logout'

  resources :cars

  get '/car/search', to: 'cars#search'
  get '/download_pdf', to: 'cars#download_pdf'

  resources :events
  get '/event/search', to: 'events#search'

  get 'enrollments', to: 'enrollments#index'
  get 'enrollments/create/:eventid', to: 'enrollments#create', as: 'create_enrollment'
  get 'enrollments/discard/:eventid', to: 'enrollments#discard', as: 'discard_enrollment'

  resources :profiles, only: %i[index edit update]

  resources :addresses, only: %i[edit update]

  get '/event/comments/:id', to: 'comments#index', as: 'show_comments'
  get '/event/addcomment/:id', to: 'comments#add_comment', as: 'add_comments'
  get '/event/likecomment/:id', to: 'comments#like_comment', as: 'like_comments'
  get '/event/unlikecomment/:id', to: 'comments#unlike_comment', as: 'unlike_comments'
end
