Rails.application.routes.draw do
  resources :payments, only: [] do
    collection do
      post 'fetch_order'
      post 'capture_payment'
    end
  end
  post '/create_order', to: 'payments#create_order'
  get '/create_order', to: 'orders#create_order'
  get '/orders/payments/:id', to: 'orders#payments'
  get '/payments/fetch_order/:id', to: 'payments#fetch_order'
  get 'payments/fetch_order/:id', to: 'payments#fetch_order'
end
