Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :articles
  resources :users
  # resources :comments
  resources :sessions

  resources :articles do
    member do
      put "like" => "articles#vote"
    end
  end

  resources :articles do
  	resources :comments
  end




post "comments/upvote"


root "articles#index"


get "search_results" => "search_results#index", as: "search_results"

post "search_results/index"



end