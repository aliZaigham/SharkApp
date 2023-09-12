class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :subitem_id
      t.decimal :quantity
      t.string :order_status

      t.timestamps
    end
  end
end
