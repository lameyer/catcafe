class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :cat_id
      t.integer :cafe_id
      t.datetime :entered_at
      t.datetime :exited_at
      t.timestamps null: false
    end
  end
end
