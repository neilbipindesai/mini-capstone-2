class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, length: { in: 200..500 }

  def discounted?
    price < 50
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  
  end
end











