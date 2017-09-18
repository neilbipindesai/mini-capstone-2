class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  

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
