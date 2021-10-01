Rails.application.routes.draw do
  get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/:id', to: 'tasks#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
