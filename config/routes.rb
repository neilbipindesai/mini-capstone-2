Rails.application.routes.draw do

  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/random' => 'product#random'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"


  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  get '/cart' => 'carted_products_controller#index'
  get '/carted_products' => 'carted_products_controller#index' 
  post '/carted_products' => 'carted_products_controller#create'

 
end
