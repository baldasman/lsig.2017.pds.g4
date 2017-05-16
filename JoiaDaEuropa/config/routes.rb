Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/profile/index'
  get '/home/index'
  get '/client_area/index'
  get '/end_order/index'
  get '/cancel_order/index'

  get '/hold_order/index'

  get '/client_area/edit_client'
  patch '/client_area/save_client'


  get '/order/index'
  get '/order/new'
  get '/order/show'
  post '/order/create'

  root to: 'profile#index'
  
end
