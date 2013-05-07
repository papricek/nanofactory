Nanofactory::Application.routes.draw do

  root to: 'pages#index'

  resources :users
  resources :user_sessions
  resources :password_resets

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

end
