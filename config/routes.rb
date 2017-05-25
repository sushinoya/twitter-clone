Rails.application.routes.draw do

  root to: 'pages#home'

  get 'home', to: 'pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :my do

    root to: 'dashboard#index'

    resources :dashboard, only: [:index]

    put 'update-status', to: 'status_update#update'

    resources :tweets, only: [:create, :destroy]

    resources :follow_requests, only: [:new, :create, :destroy] do
      member do
        put 'accept'
        put 'reject'
        put 'resend'
      end
    end

  end

end
