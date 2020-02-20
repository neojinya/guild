Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :users, :only => [:show]
  get 'plans' => 'plans#index'
  get 'plans/new' => 'plans#new'
  post 'plans' => 'plans#create'
  get 'users/:id' => 'users#show'
  get 'plans/show' => 'plans#show'
end
