class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :breed
      t.string :color
      t.string :personality
      t.timestamps null: false
    end
  end
end
