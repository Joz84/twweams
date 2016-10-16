Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  post 'datetime', to: "birthdays#datetime", as: "datetime"
  devise_for :users
  root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'pages#home'
  resources :posts, only: [:index, :create, :destroy]
  resources :birthdays, only: [:create]
end
