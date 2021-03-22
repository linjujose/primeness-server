Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get '/help', to: 'pages#help'
  get '/result', to: 'pages#result'
  
  post '/user_entries', to: 'user_entries#check'
  get '/user_entries', to: 'user_entries#new'
end
