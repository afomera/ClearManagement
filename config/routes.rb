Rails.application.routes.draw do
  devise_for :users

  resources :inventory_reports
  resources :service_requests do
    collection do
        get :open
        get :in_progress
    end
  end
  root to: "pages#home"
  get 'pages/home'

end
