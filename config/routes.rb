Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, 
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    # fixes redirect on error in form submission on new_user_registration_path
    get '/users', to: 'devise/registrations#new'
  end

  resources :music, only: [ :index ]
  root "music#index"
end
