Rails.application.routes.draw do
  get '/all_products_url' => 'products#all_products_action'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
