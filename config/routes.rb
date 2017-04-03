Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  mount ActionCable.server => '/cable'

  get 'birthday', to: "pages#birthday", as: "birthday"
  get 'selection', to: "pages#selection", as: "selection"
  devise_for :users

  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'

  resources :posts, only: [:index, :create, :destroy]
  resources :messages, only: [:destroy]

  resources :users, only: [:show, :edit, :update] do
    resources :connections, only: [:create]
  end

  resources :connections, only: [] do
   resources :messages, only: [:index, :create, :destroy]
  end

  patch 'picture/:id', to: "users#picture", as: "picture"
  put 'picture/:id', to: "users#picture"
end
