class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :name, default: ''
      t.decimal :price, precision: 8, scale: 2
      t.references :category, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
