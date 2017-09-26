class OrdersController < ApplicationController
  
    def create   
      carted_products = current_user.carted_products.where(status: "carted")   
      subtotal = 0
      carted_products.each do |item|     
      subtotal += (item.product.price * item.quantity)    
      item.assign_attributes( status: "purchased")    
      item.save   
    end   
      tax = subtotal * 0.09  
      total = subtotal + tax    
      order = Order.new(
                        user_id: current_user.id, 
                        subtotal: subtotal, 
                        tax: tax, 
                        total: total 
                        )   
      order.save   
      flash[:success] = "Order Successfully Created"  
      redirect_to "/orders/#{order.id}"   
    end

  def show

     @order = Order.find(params[:id])
  end
end