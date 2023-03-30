Rails.application.routes.draw do
  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here
      get 'shifts/:id', to: 'shifts#show'
      # resources :shifts
      get 'employees', to: 'employees#index'
      
      

    end
  end

  # Routes for regular HTML views go here...
  








  # You can have the root of your site routed with 'root'
  
  
end
