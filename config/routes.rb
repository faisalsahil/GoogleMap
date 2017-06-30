Rails.application.routes.draw do
   resources :pins
  resources :places
  resources :users

  root 'pins#index'


  # resources :users
  # resources :places, except: [:update, :edit, :destroy]
  # root 'places#index'
  #
  # resources :distances, only: [:new, :create]
  # get 'distances/new'
  #
  # get 'distances/create'
  #
  # get 'places/index'
  #
  # get 'places/new'
  #
  # get 'places/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
