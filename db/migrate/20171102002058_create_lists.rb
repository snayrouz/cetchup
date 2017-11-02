class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.integer :board_id, :null => false
      t.string :title
      t.boolean :open, :null => false, :default => true
      t.timestamps
    end
    add_index :lists, :board_id
  end
end
