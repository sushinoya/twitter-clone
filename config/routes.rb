Rails.application.routes.draw do

  root to: 'pages#home'

  get 'home', to: 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  put 'update-status', to: 'status_update#update'

end
