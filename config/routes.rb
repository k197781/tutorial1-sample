Rails.application.routes.draw do
  
  get '/signup', to:'users#new'

  root 'static#home'
  
  get '/home', to:'static#home'
  
  get '/Pages', to:'static#Pages'

  get '/help', to:'static#help'
  
  get '/about', to:'static#about'
  
  get '/contact', to:'static#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
