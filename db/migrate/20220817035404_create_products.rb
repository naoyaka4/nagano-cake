class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :non_taced_price
      t.string :image
      t.boolean :is_active

      t.timestamps
    end
  end
end
