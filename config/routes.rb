Rails.application.routes.draw do
  # get 'route/name'
  # get 'route/region:references'
  # get 'route/source:references'
  # get 'route/destination:references'
  resources :routes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :locations
  # Defines the root path route ("/")
  # root "articles#index"

  resources :transporters

  resources :transport_bids
end
