class AddCostsToItems < ActiveRecord::Migration
  def change
    add_column :items, :purchase_price, :integer
    add_column :items, :visit_price, :integer
    add_column :items, :min_visit_duration, :integer
    add_column :items, :max_visit_duration, :integer
    add_column :users, :balance, :integer, { default: 1200 }
  end
end
