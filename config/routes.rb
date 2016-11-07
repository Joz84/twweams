Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  # post 'datetime', to: "birthdays#datetime", as: "datetime"
  get 'birthday', to: "pages#birthday", as: "birthday"
  get 'show/:id', to: 'pages#show', as: "show"
  get 'profile', to: 'pages#edit', as: "profile"
  patch 'update', to: 'pages#update', as: "update"
  put 'update', to: 'pages#update'
  get 'selection', to: "pages#selection", as: "selection"
  #post '/connections/:connection_id/messages', to: "messages#create", as: "create_message"
  devise_for :users
  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'
  resources :posts, only: [:index, :create, :destroy]
  resources :users, only: [] do
    resources :connections, only: [:create]
  end
  resources :connections, only: [] do
   resources :messages, only: [:index, :create, :destroy]
  end
  resources :messages, only: [:destroy]
end
