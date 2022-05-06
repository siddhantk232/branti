Rails.application.routes.draw do
  get '/search', to: "search#index"

  get 'moderation/index'
  patch 'moderation/update/:id', to: "moderation#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :albums
  resources :playlists
  post "/playlists/add", to: "playlists#add"
  resources :genres
  resources :music

  root "music#index"

  devise_for :users, 
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :users do
    # fixes redirect on error in form submission on new_user_registration_path
    get '/users', to: 'devise/registrations#new'
    get '/users/profile', to: 'users/profiles#edit'
    post '/users/profile/:id/edit', to: 'users/profiles#update'
  end
end
