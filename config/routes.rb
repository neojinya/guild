Rails.application.routes.draw do
  root  'plans#index'
  get 'users/show'

  devise_for :users
  resources :users, :only => [:show]
  get 'plans' => 'plans#index'
  get 'plans/new' => 'plans#new'
  post 'plans' => 'plans#create'
  get 'plans/:id' => 'plans#show'
  get 'plans/:id/edit' => 'plans#edit'
  delete 'plans/:id' => 'plans#destroy'
  patch 'plans/:id' => 'plans#update'
  get 'users/:id' => 'users#show'
end
