Rails.application.routes.draw do
  
  
   resources :orders do
   resources:orderitems
 end
  resources :line_items 
  resources :carts

 devise_for :users, controllers: {
   signup: 'signup_controller'
  } do
  resources :orders 
end
  resources :users
  resources :products
  resources :contacts, :only => [:create]
  
  root 'static_pages#home'
  
  get '/home' => 'static_pages#home'
  
  get '/confirmation/:id' => 'static_pages#confirmation'
  
  get '/shop' => 'products#show'
  
  get '/users/:id', to: 'users#show'
  
  get '/cart/clear' => 'cart#clear'
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  
  get '/users/sign_up' => 'static_pages#signup'
  get '/users/sign_in' => 'static_pages#login'
  get '/users' => 'views#user'
  
  get '/contacts/new' => 'contacts#new'
  get '/contacts' => 'contacts#create'
  get 'contacts/confirmation' => 'contacts#confirmation'

  
  get 'users/:id/products' => 'products#view'
  get 'users/:id/orders' => 'orders#view'
  
  get '/checkout' => 'cart#createOrder'
  get '/orders/' => 'order#show'
  
  post '/search' => 'products#search'
end