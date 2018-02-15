Rails.application.routes.draw do
  root to: 'home#index'
  resources :home
  post 'home/search', to: 'home#search'

end
