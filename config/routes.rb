Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :projs, only: [:create, :destroy, :showproj, :update, :edit_proj, :edit]


  
  root "project#indexpage"
  match '/home',  to: 'users#home',         via: 'get'
  match '/login',   to: 'loginsystem#login',   via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/projects', to: 'project#index', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signin',  to: 'sessions#create',         via: 'post'
  get 'message/create'
  
  
  get 'indexpage', to: 'project#indexpage'
  get 'projs/:id', to: 'users#showproj'
  get 'projects', to: 'project#index'
  get 'projects/:id', to: 'project#show', as: 'project'
  get 'projects/:id/chat', to: 'project#chat', as: 'project_chat' 
  post 'projects', to: 'project#create'
  post '/messages', to: 'message#create'
end

