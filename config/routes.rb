Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :articles do
    resources :comments
  end
end
