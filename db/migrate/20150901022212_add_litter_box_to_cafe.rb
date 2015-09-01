class AddLitterBoxToCafe < ActiveRecord::Migration
  def change
    add_column :cafes, :litter_box_capacity, :integer, { default: 10 }
    add_column :cafes, :poop_count, :integer, { default: 0 }
  end
end
