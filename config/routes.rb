Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'
  get '/synths', to: 'synths#index'
  get '/synths/:id', to: 'synths#show'
end
