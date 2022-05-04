Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :albums
  resources :playlists
  resources :genres
  resources :music, only: [ :index, :new, :create, :show ]

  root "music#index"

  devise_for :users, 
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    # fixes redirect on error in form submission on new_user_registration_path
    get '/users', to: 'devise/registrations#new'
    get '/users/profile', to: 'users/profiles#edit'
    post '/users/profile/:id/edit', to: 'users/profiles#update'
  end
end
