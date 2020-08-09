Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/create'

  root  'plans#index'
  get 'users/show'

  devise_for :users,controllers:{
    registrations: 'users/registrations'
  }
  resources :users, :only => [:show, :edit]
  resources :plans
  resources :comments
  # get 'plans' => 'plans#index'
  # get 'plans/new' => 'plans#new'
  # # post 'plans' => 'plans#create',as:"plans"
  # post 'plans' => 'plans#create'
  # get 'plans/:id' => 'plans#show'
  # get 'plans/:id/edit' => 'plans#edit'
  # delete 'plans/:id' => 'plans#destroy'
  # patch 'plans/:id' => 'plans#update'
  # get 'users/:id' => 'users#show'
  # get 'users/edit' => 'users#edit'
end
