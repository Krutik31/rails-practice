namespace :api do
  namespace :v1 do
    defaults format: :json do
      get '/data', to: 'data#index'
      get '/customers', to: 'data#customers_data'
      get '/items', to: 'data#items_data'
      get '/orders', to: 'data#orders_data'
    end
  end
end
