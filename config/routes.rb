Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  get '/companies/:id', to: 'companies#show'
  get 'companies/:company_id/synths', to: 'companies/synths#index'
  get '/companies/:id/synths/new', to: 'companies/synths#new'
  post '/companies/:id/synths', to: 'companies/synths#create'
  delete '/companies/:id', to: 'companies#destroy'
  
  get '/synths/:id/edit', to: 'synths#edit'
  patch '/synths/:id', to: 'synths#update'
  get '/synths', to: 'synths#index'
  get '/synths/:id', to: 'synths#show'
  delete '/synths/:id', to: 'synths#destroy'
  
end
