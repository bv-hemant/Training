Rails.application.routes.draw do
  root "Users#index"

  resources :users do
  resources :articles
  #
end
