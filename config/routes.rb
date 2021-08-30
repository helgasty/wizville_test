Rails.application.routes.draw do
  root 'links#index'
  resources :links, only: [:index, :create, :list, :destroy]
  get '/link/:identifier', to: 'links#show', as: :short
  get 'list', to: 'links#list', as: 'list'
  get '/stats/:id', to: 'stats#show', as: :statistics
end
