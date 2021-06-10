Rails.application.routes.draw do
  
  resources :user_stocks
  root 'welcome#index'
  devise_for :users
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
