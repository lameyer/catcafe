class CreateCafeItemVisits < ActiveRecord::Migration
  def change
    create_table :cafe_item_visits do |t|
      t.integer :cat_id
      t.integer :cafe_item_id
      t.integer :cafe_visit_id
      t.datetime :entered_at
      t.datetime :exited_at
      t.timestamps null: false
    end

    rename_table :visits, :cafe_visits
  end
end
