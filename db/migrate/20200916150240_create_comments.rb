class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :deal_id, null: false
      t.integer :seller_id
      t.integer :buyer_id
      t.text :text, null: false
      t.timestamps
    end
  end
end
