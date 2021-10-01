Rails.application.routes.draw do
  get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/add', to: 'tasks#add'
  get '/:id', to: 'tasks#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
