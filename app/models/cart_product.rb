class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

   validates :amount, presence: true


  def subtotal
   product.add_tax_non_taced_price * amount
  end
  #何を表示したいのかを考える。
  

  # #カラムの合計を求める方法
  #@cart_products.sum(&:subtotal)商品合計が出せる
  # Book.all.sum(:price)カラムだけ
  #：の前に＆を指定するとメソッドを指定できる
end
