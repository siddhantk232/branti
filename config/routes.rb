Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "music#index"

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
