class CreateSubitems < ActiveRecord::Migration[7.0]
  def change
    create_table :subitems do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :decimal
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
