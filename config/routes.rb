Nanofactory::Application.routes.draw do

  mount Mercury::Engine => '/'
    namespace :mercury do
      resources :images, only: [:create, :destroy]
      resources :areas, only: [:create]
    end
  Mercury::Engine.routes
  root to: 'pages#index'

  resources :users
  resources :user_sessions
  resources :password_resets

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

end
