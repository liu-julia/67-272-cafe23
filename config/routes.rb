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

  resources :jobs, except: [:show]

  get 'paygraderates/new', to: 'pay_grade_rates#new', as: :new_pay_grade_rate
  post 'paygraderates/', to: 'pay_grade_rates#create', as: :pay_grade_rates

  resources :pay_grades, except: [:destroy]

  get 'shiftjobs/new', to: 'shift_jobs#new', as: :new_shift_job
  post 'shiftjobs/', to: 'shift_jobs#create', as: :shift_jobs
  delete 'shiftjobs/:id', to: 'shift_jobs#destroy', as: :shift_job

  get 'shifts/timeclock', to: 'shifts#tc', as: :time_clock
  resources :shifts
  patch 'shifts/timeclock/clockin', to: 'shifts#clock_in', as: :time_in
  patch 'shifts/timeclock/clockout', to: 'shifts#clock_out', as: :time_out
  
  get 'payrolls/store_payroll/', to: 'payrolls#store_payroll', as: :store_payroll
  get 'payrolls/storeform', to: 'payrolls#store_form', as: :store_form
  get 'payrolls/employeeform', to: 'payrolls#employee_form', as: :employee_form
  get 'payrolls/employee_payroll/', to: 'payrolls#employee_payroll', as: :employee_payroll
  
end
