Rails.application.routes.draw do
  resources :influences
  resources :references
  resources :works
  resources :genres
  resources :authors
  
  root 'pages#home'
  
  get '/about', to: 'pages#about'
  
  get '/help', to: 'pages#help'
  
  get '/flare', to: 'pages#flare'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
