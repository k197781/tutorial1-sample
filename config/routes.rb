Rails.application.routes.draw do

  root 'static#home'
  
  get '/home', to:'static#home'
  get '/Pages', to:'static#Pages'
  get '/help', to:'static#help'
  get '/about', to:'static#about'
  get '/contact', to:'static#contact'

  resources :users
  
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
