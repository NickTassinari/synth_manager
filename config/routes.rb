Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  get '/companies/:id', to: 'companies#show'
  get 'companies/:company_id/synths', to: 'companies/synths#index'
  get '/synths', to: 'synths#index'
  get '/synths/:id', to: 'synths#show'
end
