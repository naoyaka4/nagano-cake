class OrderDetail < ApplicationRecord
  enum create_status: { production_impossible: 0, awaiting_production: 1, in_production: 2, production_completed: 3 }

  belongs_to :product
  belongs_to :order

  def sum_of_detail_price
    purchase_price * amount
  end
  
  def sum_of_detail_price
    purchase_price * amount
  end
  
end
