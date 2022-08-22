class OrderDetail < ApplicationRecord
  enum making_status: {production_impossible: 0, awaiting_production: 1, in_production: 2, production_completed: 3 }
  
  belongs_to :product
  belongs_to :order
end
