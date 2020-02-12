Rails.application.routes.draw do
  devise_for :users
  get 'plans' => 'plans#index'
end
