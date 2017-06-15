Rails.application.routes.draw do
  
  root 'static#home'
  
  get 'static/home'
  
  get 'static/Pages'

  get 'static/help'
  
  get 'static/about'
  
  get 'static/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
