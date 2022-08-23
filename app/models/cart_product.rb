class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :products

  def sum_of_price
    product.price * quantity
  end
end
