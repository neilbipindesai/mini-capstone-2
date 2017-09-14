class Product < ApplicationRecord
  belongs_to :supplier
  

  def sale_message
    price < 11 ? "Discount Item" : "Everyday Item"
  end

  def tax
    price * 0.09
  end

  def total
    price + (price * 0.09)
  end


end
