Rails.application.routes.draw do
 root'pages#home'
 
 get '/home', to: 'pages#home'
 
 resources :recipes do
  member do 
   post 'like'
  end
 end
 
 resources :chefs, except: [:new, :destroy]
 
 get '/register', to: 'chefs#new'
 
 # login -> new session
 get '/login', to: 'logins#new'
 
 # post login -> create 
 post '/login', to: 'logins#create'
 
 # logout -> close session
 get '/logout', to: 'logins#destroy'
 
 resources :styles, only: [:new, :create, :show]
 resources :ingredients, only: [:new, :create, :show]
 
 
end
