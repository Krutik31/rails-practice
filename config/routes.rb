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

  resources :employees
  get '/all', to: 'employees#all_employees', as: 'get_all_employees'
  get '/employee/search', to: 'employees#search', as: 'search_by_email'
  get '/employee/change_order/:order/:id', to: 'employees#change_order', as: 'change_order_numbers'
  get '/filter', to: 'employees#filter_employees', as: 'filter_employees'

  get '/items/active', to: 'items#active_items', as: 'active_items'
  resources :items do
    get '/orders', to: 'orders#orders_by_product', as: 'orders'
    get '/order/new', to: 'orders#new', as: 'order'
  end
  root 'items#index'

  draw(:business)

  get '/order/filter', to: 'orders#filter_orders', as: 'filter_orders'
  get '/order/search', to: 'orders#search', as: 'search_by_product'
  resources :orders, except: %i[new]

  draw(:api)
end
