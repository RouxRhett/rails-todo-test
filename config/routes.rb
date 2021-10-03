Rails.application.routes.draw do
  root 'tasks#index'

  get 'tasks/index'
  get '/', to: 'tasks#index'

  get '/add', to: 'tasks#add', as: 'add'
  post '/add', to: 'tasks#create'

  get '/:id', to: 'tasks#show', as: 'show'
  delete '/:id', to: 'tasks#delete', as: 'delete'

  get '/edit/:id', to: 'tasks#edit', as:'edit'
  post '/edit/:id', to: 'tasks#update'
  patch '/edit/:id', to: 'tasks#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
