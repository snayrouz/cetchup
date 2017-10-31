class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :description
      t.string :open, :null => false, :default => true

      t.timestamps
    end
  end
end
