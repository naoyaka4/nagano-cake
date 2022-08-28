class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :amount
      t.integer :create_status, default: 0
      t.integer :purchase_price

      t.timestamps
    end
  end
end
