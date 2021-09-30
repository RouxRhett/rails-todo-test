Rails.application.routes.draw do
  get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/2', to: 'tasks#test'#削除予定
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
