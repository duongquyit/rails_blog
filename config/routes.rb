Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "home#index"

  devise_for :admins, :path => '/admins'
  get 'admins/dashboard', to: 'admins#index'

  get 'registrations/update'
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'dashboard', to: 'users#index'

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end

  resources :users

  resources :articles do
    resources :comments
  end

end