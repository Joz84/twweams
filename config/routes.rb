Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users

  scope "(:locale)", locale: /fr|en/ do
    get 'birthday', to: "pages#birthday", as: "birthday"
    get 'selection', to: "pages#selection", as: "selection"
    root to: "pages#dashboard", constraints: lambda { |r| r.env["warden"].authenticate? }
    root to: 'pages#home'
    resources :posts, only: [:index, :create, :destroy]
    resources :users, only: [:show, :edit, :update] do
      resources :connections, only: [:create]
    end
    resources :connections, only: [] do
     resources :messages, only: [:index, :create, :destroy]
    end
    resources :messages, only: [:destroy]

    patch 'picture/:id', to: "users#picture", as: "picture"
    put 'picture/:id', to: "users#picture"
  end
end
