class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_pay: 0, confilmation: 1, under_manufacture: 2, prepare_to_ship: 3, shipped: 4 }
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
 
end
