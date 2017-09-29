class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all

    sort_attribute = params[:sort]
    order_attribute = params[:sort_order]
    discount_amount = params[:discount]
    category_attribute = params[:category]

    if category_attribute
      category = Category.find_by(name: category_attribute)
      @products = category.products
    end

    if discount_amount
      @products = @products.where("price < ?", discount_amount)
    end

    if sort_attribute && order_attribute
      @products = @products.order({sort_attribute => order_attribute})
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end
  end

  def new
    @suppliers = Supplier.all
    @product = Product.new
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          description: params[:description],
                          price: params[:price],
                          supplier_id: params[:supplier_id]
                          )
    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      @errors = @product.errors.full_messages
      render "new.html.erb"
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(
                              name: params[:name],
                              description: params[:description],
                              price: params[:price],
                              supplier_id: params[:supplier_id]
                              )
    if product.save
    flash[:success] = "Product Updated"
    redirect_to "/products/#{product.id}"
    else
      @suppliers = Supplier.all
      @errors = @product.error.full_messages
      render "edit.html.erb"

    end

    def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end

  def random
    product_id = Product.all.sample.id
    redirect_to "/products/#{product_id}"
  end
 end
end


