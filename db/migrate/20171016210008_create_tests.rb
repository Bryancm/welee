class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.integer :animal_id

      t.timestamps
    end
     add_index :tests, :user_id
    add_index :tests, :animal_id
  end
end
