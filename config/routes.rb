Rails.application.routes.draw do
  resources :references
  resources :works
  resources :genres
  resources :authors
  get 'pages/home'

  get 'pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
