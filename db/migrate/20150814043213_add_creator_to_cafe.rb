class AddCreatorToCafe < ActiveRecord::Migration
  def up
    add_column :cafes, :user_id, :integer
    Cafe.update_all(:user_id => 1)
  end

  def down
    remove_column :cafes, :user_id, :integer
    Cafe.update_all(:user_id => nil)
  end

end
