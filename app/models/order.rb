class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true

  def compute_subtotal_tax_and_total
    compute_subtotal = quantity * product.price
    compute_tax = quantity * product.tax
    compute_total = compute_subtotal + compute_tax
    update(subtotal: compute_subtotal, tax: compute_tax, total: compute_total)
  end
end










