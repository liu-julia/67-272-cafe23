Rails.application.routes.draw do
  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here
      get 'shifts/:id', to: 'shifts#show', as: :shift
      # resources :shifts
      get 'employees', to: 'employees#index', as: :employees
      get 'stores/:id/:upcoming', to: 'stores#show', as: :upcoming_shifts
      # resources :stores
      

    end
  end

  # Routes for regular HTML views go here...
  
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  # You can have the root of your site routed with 'root'
  root 'home#index'

  resources :sessions
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :employees

  resources :stores, except: [:destroy]

  resources :assignments


  # You can have the root of your site routed with 'root'
  
  
end
