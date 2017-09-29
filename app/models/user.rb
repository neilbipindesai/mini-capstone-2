class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products

  validates :email, uniqueness: true

  def current_cart
    carted_products.where(status: "carted")
  end
end
