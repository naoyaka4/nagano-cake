class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :cost
      t.integer :status, default: 0
      t.integer :payment_method
      t.string :name
      t.string :post_code
      t.string :address
      t.integer :total_payment
      

      t.timestamps
    end
  end
end
