class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    sum = 0
    carted_products.each do |carted_product|
      sum += carted_product.subtotal
    end
    self.subtotal = sum
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def calculate_totals
    calculate_subtotal
    calculate_tax
    calculate_total
    save
  end
end









