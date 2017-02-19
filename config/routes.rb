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
  
  get '/genre_count', to: 'pages#genre_count'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/ref_work', to: 'pages#ref_work'

get '/stacked', to: 'pages#stacked'

end
