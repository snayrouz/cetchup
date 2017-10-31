class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, :null => false, :unique => true
      t.string :password_digest

      t.timestamps
    end
  end
end
