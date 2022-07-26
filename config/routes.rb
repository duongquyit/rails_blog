Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'registrations/update'
  root to: "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :articles do
    resources :comments
  end
end
