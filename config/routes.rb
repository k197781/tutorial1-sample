Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static#home'
  
  get '/home', to:'static#home'
  get '/Pages', to:'static#Pages'
  get '/help', to:'static#help'
  get '/about', to:'static#about'
  get '/contact', to:'static#contact'

  resources :users
  
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  resources :account_activations, only:[:edit]
  
  resources :password_resets, only:[:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
