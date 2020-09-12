class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :overview,                 null: false
      t.text    :info,                     null: false
      t.integer :price,                    null: false
      t.integer :category_id,              null: false
      t.integer :delivery_fee_id,          null: false
      t.integer :shipping_area_id,         null: false
      t.timestamps
    end
  end
end
