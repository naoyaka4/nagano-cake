class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

   validates :amount, presence: true


  def subtotal
   product.purchase_price * amount
  end
  
  # #カラムの合計を求める方法
  # Book.all.sum(:price)
end
