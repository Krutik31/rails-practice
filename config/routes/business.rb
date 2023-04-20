namespace :business do
  get 'customer/task/:id', to: 'customers#task', as: 'customer_task'
  resources :customers, only: %i[index new create edit update] do
    get '/preview', to: 'customers#preview', as: 'preview'
    delete '/delete_customer', to: 'customers#delete_customer', as: 'delete_customer'

    collection do
      get 'search'
    end
  end
end
