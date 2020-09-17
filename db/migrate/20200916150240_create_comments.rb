class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :deal_id, null: false
      t.integer :seller_id, null: false
      t.integer :buyer_id, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
