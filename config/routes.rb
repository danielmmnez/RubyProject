Rails.application.routes.draw do
  resources :categories, except: :show
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  resources :phones
  root "phones#index"
  post 'cart/payout'
  post 'cart/clear'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "articles#index"
  
end
