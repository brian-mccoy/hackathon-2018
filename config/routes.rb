Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/new'

  resources :tickets do
    resources :comments
  end

  resources :projects
  resources :teams

  root 'dashboard#index'
end
