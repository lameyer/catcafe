class CreateCafeItems < ActiveRecord::Migration
  def change
    create_table :cafe_items do |t|
      t.integer :cafe_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
