Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :articles
  resources :users
  resources :comments





root "articles#index"



end