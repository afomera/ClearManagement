Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :inventory_reports
  resources :service_requests do
    member do
      patch :close
      patch :reopen
      patch :make_inprogress
    end
    collection do
        get :open
        get :in_progress
    end
  end
  
end
