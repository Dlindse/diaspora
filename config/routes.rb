Rails.application.routes.draw do
  resources :influences
  resources :references
  resources :works
  resources :genres
  resources :authors
  
  root 'grayscales#index'
  
  get 'grayscales/index'
  
  get '/about', to: 'pages#about'
  
  get '/help', to: 'pages#help'
  
  get '/flare', to: 'grayscales#flare'
  
  get '/genre_count', to: 'grayscales#genre_count'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/ref_work', to: 'grayscales#ref_work'

get '/stacked', to: 'grayscales#stacked'

end
