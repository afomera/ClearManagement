Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :conversations, only: [:index, :show] do
    resources :messages, module: :conversations, only: [:index, :new, :create, :show]
  end

  resources :inventory_reports
  resources :service_requests do
    resources :activity, module: :service_requests, only: [:new, :create]
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
  resources :technicians
  resources :payment_imports, only: [:index, :new, :create]

  # Twilio Webhooks
  post 'conversations/messages/reply', to: 'conversations/messages#reply'
end
