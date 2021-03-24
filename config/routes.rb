Rails.application.routes.draw do
  resources :perks
  resources :businesses
  resources :alliances
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/auth/login', to: 'authentication#login'
  get 'auth/verify', to: 'authentication#verify'

  post '/subscribe/:business_id/', to: 'user_alliances#subscribe'


  # made a changeß
end
