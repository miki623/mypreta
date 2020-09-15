class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :buyer,      foreign_key: true
      t.references :item,       foreign_key: true
      t.timestamps
    end
  end
end
