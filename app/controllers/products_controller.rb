class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  
  end

  def create
    product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    product.save

    flash[:success] = "New Brand of Ciggerette Successfully Created"
    redirect_to "/products/#{product.id}"


  end


  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    product = Product.find(params[:id])
    
    product.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])

    product.save
    flash[:success] = "Brand of Ciggerette Successfully Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:warning] = "Brand of Ciggerette Successfully Destroyed"
    redirect_to "/products"

  end

end