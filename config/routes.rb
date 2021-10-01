Rails.application.routes.draw do
  get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/add', to: 'tasks#add'
  post '/add', to: 'tasks#create' 
  get '/:id', to: 'tasks#show'
  get '/edit/:id', to: 'tasks#edit'
  post '/edit/:id', to: 'tasks#update'
  patch '/edit/:id', to: 'tasks#update'
  get '/delete/:id', to: 'tasks#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
