class ProductsController < ApplicationController
  def index
    @products = Product.all

    sort_attribute = params[:sort]
    sort_direction = params[:dir]
    discount_amount = params[:discount]
    random = params[:random]


    if sort_attribute
      
      @products = @products.order(sort_attribute => sort_direction)
    elsif discount_amount
      @products = Product.where("price < ?", discount_amount)
    end
       
      category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = category.products
    end
  end
  
 


  def new
  
  end

  def create
    product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    product.save

    flash[:success] = "New Brand of Ciggerette Successfully Created"
    redirect_to "/products/#{product.id}"


  end

  def random
     product_id = Product.all.sample.id
     redirect_to "/products/#{product_id}"
  end

  
  def show
    @product = Product.find_by(id: params[:id])

  end
 

  def edit
    @product = Product.find_by(id: params[:id])

  end

  def update
    product = Product.find_by(id: params[:id])
    
    product.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])

    product.save
    flash[:success] = "Brand of Ciggerette Successfully Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Brand of Ciggerette Successfully Destroyed"
    redirect_to "/products"

  end

end