Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/new'

  resources :tickets

  root 'dashboard#index'
end
