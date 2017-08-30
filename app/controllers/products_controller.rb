class ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render 'all_products_page.html.erb'
  end
end
