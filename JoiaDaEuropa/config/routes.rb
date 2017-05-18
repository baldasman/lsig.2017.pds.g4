Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/profile/index'
  get '/home/index'
  get '/client_area/index'
  #get '/search'

  get '/client_area/edit_client'
  patch '/client_area/save_client'

  get '/order/recent'
  get '/order/hold'
  get '/order/cancel'
  get '/order/end'
  get '/order/detail/:id', to: 'order#detail', as: 'order_detail'
  get '/order/edit/:id', to: 'order#edit', as: 'order_edit'
  post '/order/update'
  get '/order/new'
  get '/order/all'
  post '/order/create'


  root to: 'home#index'
  
end
