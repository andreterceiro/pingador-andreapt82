Rails.application.routes.draw do
  resources :users
  get "login/logout", to: "login#logout" 
  get "login/login", to: "login#login" 
  post "login/login", to: "login#login" 
  resources :hosts
  root to: "hosts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
