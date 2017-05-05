Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/profile/index'
  get '/test/edit_client'
  get '/test/save_client'

  root to: 'home#index'


end
