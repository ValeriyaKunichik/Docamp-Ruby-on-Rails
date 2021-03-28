Rails.application.routes.draw do
  resources :users

  root "project#indexpage"
  
  match '/login',   to: 'loginsystem#login',   via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/projects', to: 'project#index', via: 'get'

  get 'message/create'
  get 'loginsystem', to: 'loginsystem#login'
  get 'indexpage', to: 'project#indexpage'
  get 'signup', to: 'signup#signup'
  get 'projects', to: 'project#index'
  get 'projects/:id', to: 'project#show', as: 'project'
  get 'projects/:id/chat', to: 'project#chat', as: 'project_chat' 
  post 'projects', to: 'project#create'
  post '/messages', to: 'message#create'
end

